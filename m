From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2009 09:24:38 +0100
Subject: [Buildroot] Building a usable ImageMagick
In-Reply-To: <20091104072640.GC10219@jasper.tkos.co.il>
References: <20091104072640.GC10219@jasper.tkos.co.il>
Message-ID: <20091104092438.29d3c3cf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 4 Nov 2009 09:26:40 +0200,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> I'm trying to produce a working ImageMagick installation under
> Buildroot. According to my test ImageMagick depends on having *.la
> files in the /usr/lib/ImageMagick-6.4.8/modules-Q16/coders/ directory
> in order to find its codecs at run-time.

Argh, odd. I just had a quick look at ImageMagick source code, and
that's right, they seem to use the .la files at runtime, at least to
get the list of available modules.

> Unfortunately, the target-finalize target in the main Makefile
> includes the following line:
> 
> find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0
> | xargs -0 rm -f
> 
> which means that all *.la file get removed from the target. What is
> the best approach to solve this issue?

.la files really aren't meant to be used at run time, so I would
suggest to fix ImageMagick. Why don't they use the .so files to get the
list of available modules ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
