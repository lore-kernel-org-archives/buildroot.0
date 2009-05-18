From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 18 May 2009 01:49:24 -0300
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <87k54fo1tn.fsf@macbook.be.48ers.dk>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
	<d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
	<87vdo1nti0.fsf@macbook.be.48ers.dk>
	<d6cda7730905171037r4f4aa9f7y9a12eb9377ab70f8@mail.gmail.com>
	<87k54fo1tn.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905172149h203eba31i5c9bba53609b45ff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

   I build several times, perhaps something got mixed up. Anyway, I
figured what was the problem. X was disabled by Kconfig because the
config name changed, so it picked up the default value (no X).
   I've reenabled all the packages disabled by Kconfig. X won't build
for me either, but that's not quite my changes fault. It could be X
code, or a bug with the avr32 toolchain source code.

   Do you want to commit with it updated? Or should we drop this patch
(defconfig update) or drop atngw100-expanded altogether?

   Anyway, X has nothing to do with avahi AFAIK.

   Avahi is enabled in atngw100_defconfig as well. What you would have
to do to reach the problematic code is actually enable "IPv4LL network
address configuration daemon". Perhaps it should happen on all
platforms or as I said before, there is some build order that creates
the folder first for you but not for atngw100*_defconfig 's.

Thanks,
    Thiago A. Correa
