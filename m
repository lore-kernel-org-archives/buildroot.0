From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 09:22:06 +0100
Subject: [Buildroot] [PATCH 3/3] package/openmvtools: don't use host
 library path
In-Reply-To: <1423437730-22997-3-git-send-email-romain.naour@openwide.fr>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
 <1423437730-22997-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150214092206.71b95d13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon,  9 Feb 2015 00:22:10 +0100, Romain Naour wrote:

>  ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> -OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
> +	CUSTOM_PROCPS_LIBS="-L$(STAGING_DIR)"

This is wrong, because $(STAGING_DIR) does not contain libraries. It
should either be -L$(STAGING_DIR)/usr/lib and/or
-L$(STAGING_DIR)/usr/lib. And also, please add a comment above this to
explain why we are passing this explicitly (it should normally not be
needed).

I've marked this patch as Changes Requested in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
