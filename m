From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:17:09 +0200
Subject: [Buildroot] [PATCH v4 2/8] package/libsemanage: bump version to
 3.0
In-Reply-To: <20200415125921.57648-3-matthew.weber@rockwellcollins.com>
References: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
 <20200415125921.57648-3-matthew.weber@rockwellcollins.com>
Message-ID: <20200417221709.5bd6161e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 07:59:15 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  HOST_LIBSEMANAGE_MAKE_OPTS += \

We had an unconditional assignment here.

>  	$(HOST_CONFIGURE_OPTS) \
> @@ -39,19 +40,10 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
>  	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
>  	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
>  HOST_LIBSEMANAGE_MAKE_OPTS += \

And this one was conditional on python3 availability. But it is no
longer optional, so the assignment can be grouped with the previous one.

I fixed that, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
