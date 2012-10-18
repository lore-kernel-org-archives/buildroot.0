From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Oct 2012 15:38:22 +0200
Subject: [Buildroot] export ARCH and CROSS_COMPILE for the post build
 script
In-Reply-To: <507F9EFB.60601@wanadoo.fr>
References: <507F9EFB.60601@wanadoo.fr>
Message-ID: <20121018153822.58509c94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 18 Oct 2012 08:17:31 +0200, Thierry Bultel wrote:

> Could we make the export of PATH and CROSS_COMPILE to the post-build 
> script ?
> This would be really useful for building an external user application
> in one shot (and I need it in my case).
> 
> eg something like this in the top Makefile:
> 
> ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
>      @$(call MESSAGE,"Executing post-build script")
> *ARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS)* 
> $(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
> endif
> 
> Of course this could be implemented as an option.
> 
> What do you think about it ?

Why don't you create a Buildroot package to build your external
application? It sounds much more logical.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
