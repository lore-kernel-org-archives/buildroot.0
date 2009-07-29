From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2009 22:09:19 +0200
Subject: [Buildroot] [git commit] openssl: fix arch handling
In-Reply-To: <20090729195158.099A8777F5@busybox.osuosl.org>
References: <20090729195158.099A8777F5@busybox.osuosl.org>
Message-ID: <20090729220919.7fd03212@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 29 Jul 2009 21:49:45 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> -ifeq ($(BR2_ARCH),x86_64)
> +ifeq ($(ARCH),"x86_64")

unless I'm wrong this should be

ifeq ($(ARCH),x86_64)

just like the others. Or

ifeq ($(BR2_ARCH),"x86_64")

BTW, any clue why we have quotes around the value of BR2_ARCH ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
