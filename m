From: Ash Charles <ashcharles@gmail.com>
Date: Sun, 27 Nov 2016 07:41:23 -0500
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
	application
In-Reply-To: <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
 <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
Message-ID: <CAK8F28mHwYonzL1Wx052TXCzd3U4TjvfQiMPuqxuQmRBLv-2zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Sat, Nov 26, 2016 at 6:22 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  The intention here was not to create a new package, but rather to allow the
> installation of the examples provided in pru-software-support. I.e. add a config
> option "PRU_SOFTWARE_SUPPORT_INSTALL_EXAMPLES". Or rather, add a
> pru-software-support target package for the examples (the firmware files are to
> be installed on the target so it has to be a target package).
Okay.  How best to implement this?  Currently, I have
PRU_SOFTWARE_SUPPORT as a host package (Config.in.host) as previously
discussed.  In the same directory, I can add a PRU_SOFTWARE_EXAMPLES
Config.in for a target package that depends on the host package i.e. a
user will select PRU support and then, if they wish, can choose to
include the examples pack for their target.  Then, I just need to add
some steps to the existing makefile to build out the examples too.

>
>  Obviously, only 1 firmware binary can be installed. So you have the following
> options:
> - Support only one example.
> - Add config options for all the examples and let the user select it.
> - Install examples, but not as am335x-pru0-fw, but in a pru-examples
> subdirectory, leaving it up to the user to copy/link it to the correct name for
> firmware loading. Mention in the help text how to do that.
What is the best place for the examples directory tree to be installed
/opt/pru-examples?
Is it reasonable to support users who wish to select their desired
example firmware before filesystem creation (firmware can be loaded
directly on boot & maybe they have a read-only rootfs) rather than on
first boot?  I think this means they'd have to make the copy in the
output/target directory and then rerun make to finalize the rootfs.
What is the best way to give a user instructions? (Sorry for all the
questions...buildroot neophyte)

--Ash
