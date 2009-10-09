From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2009 11:57:42 +0200
Subject: [Buildroot] [PATCH 09/14] tidy up ROOTFS_{PRE,SUF}FIX handling
In-Reply-To: <ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	<b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
	<ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <20091009115742.570d90a2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 22:08:32 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

>  #########################################################################
> -#ifeq ($(BR2_ROOTFS_SUFFIX),)
>  ROOTFS_SUFFIX:=$(call qstrip,$(BR2_ROOTFS_SUFFIX))
> -ifeq ($(ROOTFS_SUFFIX),)
> -ROOTFS_SUFFIX:=
> -else
> -XXXX=xxxx
> -ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
> -endif
> +ROOTFS_PREFIX:=$(call qstrip,$(BR2_ROOTFS_PREFIX))

I would rather prefer to completely get rid of these options. You want
several projects, use O=.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
