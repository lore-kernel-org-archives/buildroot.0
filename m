From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 21:35:58 +0200
Subject: [Buildroot] [PATCH] boot/uboot: needs bison/flex even for the
 legacy buildsystem
In-Reply-To: <20180913201233.8127-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 13 Sep 2018 22:12:33 +0200")
References: <20180913201233.8127-1-yann.morin.1998@free.fr>
Message-ID: <8736tp31ep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When using the legacy buildsystem, the kconfig parser may still be used,
 > as reported by Thomas:

 >>>> uboot 2018.09 Configuring
 >     ...]
 >      HOSTCC  scripts/basic/fixdep
 >      HOSTCC  scripts/kconfig/conf.o
 >      YACC    scripts/kconfig/zconf.tab.c
 >     bin/sh: 1: bison: not found
 >     ake[3]: *** [scripts/kconfig/zconf.tab.c] Error 127
 >     ake[3]: *** Waiting for unfinished jobs....
 >      LEX     scripts/kconfig/zconf.lex.c
 >     bin/sh: 1: flex: not found

 > However, in that case, the kconfig parser is only generated during the
 > 'configure' step, so we can add bison/flex as standard dependencies.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
