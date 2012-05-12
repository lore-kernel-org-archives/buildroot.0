From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 May 2012 13:42:24 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
 helper functions
In-Reply-To: <CAHXCMM+pyaWT0_jh8Nf6LVQ-xh+1EbA_ZQ-=SXhoZnbXDsbcLw@mail.gmail.com>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate> <4FAD92BB.5040606@mind.be>
 <CAHXCMM+pyaWT0_jh8Nf6LVQ-xh+1EbA_ZQ-=SXhoZnbXDsbcLw@mail.gmail.com>
Message-ID: <20120512134224.6cfda750@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 12 May 2012 11:03:45 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> I'd prefer having something like:
> SYSTEMD_CONF_OPT += $(call AUTO_ARG_ENDISABLE,acl,$(BR2_PACKAGE_ACL))
> SYSTEMD_DEPENDENCIES += $(call COND_DEPS,acl,$(BR2_PACKAGE_ACL))

Is this really better than:

SYSTEMD_CONF_OPT     += $(if $(BR2_PACKAGE_ACL),--enable-acl,--disable-acl)
SYSTEMD_DEPENDENCIES += $(if $(BR2_PACKAGE_ACL),acl)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
