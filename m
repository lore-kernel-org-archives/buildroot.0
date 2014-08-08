From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Aug 2014 22:03:31 +0200
Subject: [Buildroot] [PATCH 1/1] openssh: replace individual ssh-keygen
	calls with a single call
In-Reply-To: <20140804091755.GL32743@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 4 Aug 2014 11:17:56 +0200")
References: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
 <20140803073726.GB4052@free.fr>
 <CANxTyt70cnBy56QgMjGSMc092fEx9O-yWwegcL6S2kRtR0dSzQ@mail.gmail.com>
 <20140804102456.774bcea3@free-electrons.com>
 <20140804091755.GL32743@waldemar-brodkorb.de>
Message-ID: <87fvh6agvg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

 > In OpenADK is use cfgfs - configuration filesystem. It maintains
 > a tmpfs based /etc and let the user commit any changes via a
 > commandline tool to a partition on a block/mtd device.

 > Only changes are compressed via LZO and written to the maximum
 > 16 MB cfgfs partition.
 > http://www.openadk.org/docs/html/manual.html#_cfgfs_configuration_file_system

Heh, I wrote something similar a few years ago:

http://git.korsgaard.com/cgi-bin/gitweb.cgi?p=cfg.git;a=summary

It simply stored .tar.gz's of the changed files.


 > It allows smooth updates without loosing device configuration data.

 > Any interest in porting it to buildroot?

We try hard to not enforce policy, so I wouldn't want to make cfgfs a
required package, but as an optional one it make sense. Please do.

-- 
Bye, Peter Korsgaard
