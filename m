From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Jul 2009 23:34:16 +0200
Subject: [Buildroot] [git commit] openssl: fix arch handling
In-Reply-To: <20090729220919.7fd03212@surf> (Thomas Petazzoni's message of
	"Wed\, 29 Jul 2009 22\:09\:19 +0200")
References: <20090729195158.099A8777F5@busybox.osuosl.org>
	<20090729220919.7fd03212@surf>
Message-ID: <87r5vzxjfr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed, 29 Jul 2009 21:49:45 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 >> -ifeq ($(BR2_ARCH),x86_64)
 >> +ifeq ($(ARCH),"x86_64")

 Thomas> unless I'm wrong this should be

 Thomas> ifeq ($(ARCH),x86_64)

 Thomas> just like the others. Or

 Thomas> ifeq ($(BR2_ARCH),"x86_64")

Argh yes, I need sleep - Will fix asap.

 Thomas> BTW, any clue why we have quotes around the value of BR2_ARCH ?

Kconfig does it for string variables.

-- 
Bye, Peter Korsgaard
