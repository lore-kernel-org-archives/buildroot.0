From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 May 2009 23:29:40 +0200
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <d6cda7730905171037r4f4aa9f7y9a12eb9377ab70f8@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Sun\, 17 May 2009
	14\:37\:38 -0300")
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
	<d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
	<87vdo1nti0.fsf@macbook.be.48ers.dk>
	<d6cda7730905171037r4f4aa9f7y9a12eb9377ab70f8@mail.gmail.com>
Message-ID: <87k54fo1tn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> I take it that you mean atngw100-expanded_defconfig? Did you try
 >> building that after your latest changes? The defconfig seems
 >> completely bogus to me - docker tried to use pkg-config from
 >> staging_dir instead of host_dir (fixed now), and you had turned off
 >> the X stuff and still tried to build libgtk2/webkit/docker/openmotif.

 Thiago> I just test built it and things that are newer than the defconfig,
 Thiago> when oldconfig jumps in asking what to do I just accepted the default
 Thiago> behavior. I didn't change it more than that. Then I run a test build,
 Thiago> and it stopped at avahi, so I fixed the problem with avahi, commited
 Thiago> avahi change, and resume the build.

 Thiago> Once I could see that the defconfg built completely, then I updated
 Thiago> the defconfig with my .config that contains the newly defined symbols
 Thiago> (with their default values).

So atngw100-expanded_defconfig builds for you even though it has X
disabled and libgtk2 / docker / webkit / sylpheed / xpdf and so on
enabled? That sounds very odd to me.

 Thiago> So, no idea what changed in the between at the main repository.

The only thing that changed to the expanded defconfig recently was
your change.

You are building from your 2009.05 branch and not master, right?

 >> Furthermore, enabling the Xserver doesn't work as there seems to be
 >> missing some avr32 support:
 >> 
 >> Are you using this?

 Thiago> I didn't try to build X, I don't use it. Unless it gets built
 Thiago> by one of the _defconfigs that I updated, then I built and
 Thiago> didn't see this happening. I can't afford to stare at the
 Thiago> screen for 30 or 40 minutes watching the build. If it doesn't
 Thiago> stop the build then mostly for sure I would miss it.

atngw100-expanded does (or rather, it should as it tried to build
stuff using X).

 >> And you didn't run into the above issues?
 >> 

 Thiago> Nope, not in my tree. They all built prior to commit to my local tree
 Thiago> and prior to push.

On the 2009.05 branch and with the -expanded defconfig?

-- 
Bye, Peter Korsgaard
