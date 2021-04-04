From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 12:07:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftrace: new package
In-Reply-To: <20210404090338.GD2252@scaer>
References: <20210403191609.1168606-1-asafka7@gmail.com>
 <20210404090338.GD2252@scaer>
Message-ID: <20210404120713.42dc0952@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(In addition to Yann comments)

On Sun, 4 Apr 2021 11:03:38 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +UFTRACE_LICENSE = GPL-2.0
> > +UFTRACE_LICENSE_FILES = COPYING
> > +
> > +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> > +UFTRACE_DEPENDENCIES += elfutils
> > +endif

This optional dependency is a bit odd. How does the uftrace build
system detects the availability of elfutils? You're not passing any
specific option when elfutils is available or not available.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
