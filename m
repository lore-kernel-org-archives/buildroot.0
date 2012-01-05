From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 05 Jan 2012 11:14:09 +0100
Subject: [Buildroot] [PATCH v5 3/6] New package: python-dpkt
In-Reply-To: <1325676605-31194-4-git-send-email-yegorslists@googlemail.com>
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
 <1325676605-31194-4-git-send-email-yegorslists@googlemail.com>
Message-ID: <4F0577F1.9070604@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2012 12:30 PM, yegorslists at googlemail.com wrote:
> diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
> new file mode 100644
> index 0000000..7ac873c
> --- /dev/null
> +++ b/package/python-dpkt/python-dpkt.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# python-dpkt
> +#
> +#############################################################
> +
> +PYTHON_DPKT_VERSION = 1.7
> +PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
> +PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
> +
> +PYTHON_DPKT_DEPENDENCIES = python
> +
> +define PYTHON_DPKT_BUILD_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> +endef
> +
> +define PYTHON_DPKT_INSTALL_TARGET_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(call GENTARGETS))
> +
Do somebody ever thought in doing a distutils package infrastructure 
that would make the adding of a new python package just a matter of:
     $(eval $(call DISTUTILSTARGETS))
(or something like that)
?

Regards,
Julien
