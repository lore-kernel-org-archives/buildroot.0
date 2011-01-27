From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jan 2011 15:42:44 +0100
Subject: [Buildroot] [PATCH 8/9] libcuefile: convert to cmaketargets
 infrastructure
In-Reply-To: <1296138094-502-8-git-send-email-gustavo@zacarias.com.ar>
References: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
	<1296138094-502-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20110127154244.198d4077@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Jan 2011 11:21:33 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

>  define LIBCUEFILE_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
>  	cp -r $(@D)/include $(STAGING_DIR)/usr
> @@ -39,4 +19,4 @@ define LIBCUEFILE_INSTALL_TARGET_CMDS
>  	cp -r $(@D)/include $(TARGET_DIR)/usr
>  endef

I would prefer to let the infrastructure do the target/staging
installation, and use the post-staging-install and post-target-install
hooks to do the headers copy trick.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
