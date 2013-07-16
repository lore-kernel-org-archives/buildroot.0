From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 14:34:58 +0200
Subject: [Buildroot] [PATCHv3 02/14] arch: Refactor BR2_SOFT_FLOAT into
	per-architecture options
In-Reply-To: <20130716141231.57cada44@skate> (Thomas Petazzoni's message of
 "Tue, 16 Jul 2013 14:12:31 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <874nbu3elx.fsf@dell.be.48ers.dk> <20130716141231.57cada44@skate>
Message-ID: <87zjtm1y4t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> What about arc/avr32/bfin/microblaze/sh/sparc/xtensa? Some of them
 >> apparently were broken in this regard already, and some of them are not
 >> supported by the internal toolchain, but with this change atleast
 >> Buildroot will always think they use hardfloat.

 Thomas> avr32 already selects BR2_SOFT_FLOAT in the current git master.

 Thomas> config BR2_avr32
 Thomas>         bool "AVR32"
 Thomas>         select BR2_SOFT_FLOAT

Ahh, good - I missed that.

 Thomas> On the other platforms you mentioned, BR2_SOFT_FLOAT was always
 Thomas> false:

Indeed.

 Thomas> From the perspective of those architectures, the BR2_SOFT_FLOAT
 Thomas> value was always false, and continues to be false after my
 Thomas> patches. If this is not correct, it should certainly be fixed,
 Thomas> but I don't think this is something that gets broken by my
 Thomas> patches: it would have already been wrong, and the Buildroot
 Thomas> code already believes those architectures are all hard float.

Ok, so the patch doesn't make it any worse than it already was, so I'll
apply it.

Thanks.

-- 
Bye, Peter Korsgaard
