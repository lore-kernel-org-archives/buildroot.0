From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 May 2009 15:52:03 +0200
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <d6cda7730905172149h203eba31i5c9bba53609b45ff@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Mon\, 18 May 2009
	01\:49\:24 -0300")
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
	<d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
	<87vdo1nti0.fsf@macbook.be.48ers.dk>
	<d6cda7730905171037r4f4aa9f7y9a12eb9377ab70f8@mail.gmail.com>
	<87k54fo1tn.fsf@macbook.be.48ers.dk>
	<d6cda7730905172149h203eba31i5c9bba53609b45ff@mail.gmail.com>
Message-ID: <877i0eo6ws.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago>    I build several times, perhaps something got mixed
 Thiago> up. Anyway, I figured what was the problem. X was disabled by
 Thiago> Kconfig because the config name changed, so it picked up the
 Thiago> default value (no X).  I've reenabled all the packages
 Thiago> disabled by Kconfig. X won't build for me either, but that's
 Thiago> not quite my changes fault. It could be X code, or a bug with
 Thiago> the avr32 toolchain source code.

 Thiago>    Do you want to commit with it updated? Or should we drop
 Thiago> this patch (defconfig update) or drop atngw100-expanded
 Thiago> altogether?

Well, basic avr32 support seems to be missing from the X server. I
don't have access to any avr32 hardware, so unless someone steps up to
fix it I think we should make BR2_PACKAGE_XSERVER_XORG_SERVER depend
on !BR2_avr32 (with a comment entry explaining it similar to the
packages needing C++/wchar/largefile support).

And then the -expanded defconfig doesn't make any sense, so it should
get removed.

 Thiago>    Anyway, X has nothing to do with avahi AFAIK.

True.

 Thiago>    Avahi is enabled in atngw100_defconfig as well. What you would have
 Thiago> to do to reach the problematic code is actually enable "IPv4LL network
 Thiago> address configuration daemon". Perhaps it should happen on all
 Thiago> platforms or as I said before, there is some build order that creates
 Thiago> the folder first for you but not for atngw100*_defconfig 's.

I normally build avahi with ipv4ll support (on ppc) without problems,
so it seems specific to atngw100. I'll do a test build and check.

-- 
Bye, Peter Korsgaard
