From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:52:07 +0100
Subject: [Buildroot] [PATCH 1/1] bash: added option to disable locale
	support
In-Reply-To: <CANQCQpbKmA6of1MQrBB1WY16rfApDYaA6J0uK8PEtHmxn96inA@mail.gmail.com>
 (Matthew Weber's message of "Mon, 9 Mar 2015 20:31:51 -0500")
References: <1425935595-46330-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150309224257.2c985fbf@free-electrons.com>
 <CANQCQpbKmA6of1MQrBB1WY16rfApDYaA6J0uK8PEtHmxn96inA@mail.gmail.com>
Message-ID: <87zj7kock8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Thomas, all.
 > On Mon, Mar 9, 2015 at 4:42 PM, Thomas Petazzoni
 > <thomas.petazzoni@free-electrons.com> wrote:
 >> Dear Matt Weber,
 >> 
 >> On Mon,  9 Mar 2015 16:13:15 -0500, Matt Weber wrote:
 >> 
 >>> +if BR2_PACKAGE_BASH
 >>> +
 >>> +config BR2_PACKAGE_BASH_NO_LOCALE
 >>> +     bool "disable locale support"
 >>> +     help
 >>> +       Disable locale support for cases where toolchain has it
 >>> +       but target isn't setup to use it.
 >>> +
 >>> +endif
 >> 
 >> To be honest, I'm not sure we want to support such cases. What does it
 >> mean for the target to not be setup to use locales?

 > I should probably clarify, this disabled the runtime check of locale
 > that bash did everytime a shell was invoked.  All packages where still
 > built with locale support.  Busybox ash didn't perform this check so
 > we never noticed it until we switched to bash.  (I believe, will have
 > to double check)Bash is running  setlocale after checking for a env
 > variable LC_xxxxx before the shell starts.  Currently we don't have
 > our env setup to by default have LC_xxxxx set.  Instead we  set the
 > LC_xxxxx as part of the service/app start rcS script. (There maybe
 > better way's of handling this I'm sure).

So what is the impact exactly of having/not having this option?

-- 
Bye, Peter Korsgaard
