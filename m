From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 15:18:28 +0100
Subject: [Buildroot] [PATCH] openssl: disable libressl on uClibc noMMU
In-Reply-To: <20171106095421.19089-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 6 Nov 2017 10:54:21 +0100")
References: <20171106095421.19089-1-thomas.petazzoni@free-electrons.com>
Message-ID: <877ev3xzgr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > uClibc doesn't implement __register_atfork() on noMMU systems, causing
 > a build failure of libressl. Since openssl is available as an
 > alternative on such platforms, we just disable libressl on
 > uClibc/noMMU systems.

 > Fixes:

 > /home/thomas/projets/buildroot/output/build/libressl-2.5.5/crypto/.libs/libcrypto.a(arc4random.o): In function `_rs_init.part.1':
 > arc4random.c:(.text+0x74): undefined reference to `__register_atfork'
 > collect2: error: ld returned 1 exit status

 > This build issue is not visible in the autobuilders, because libressl
 > is only selectable through a choice, which isn't randomized by the
 > autobuilder logic.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
