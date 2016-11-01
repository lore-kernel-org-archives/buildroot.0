From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:36:20 +0100
Subject: [Buildroot] [PATCH] owfs: install python bindings in the
 correct location
In-Reply-To: <20161101141448.14792-1-arnout@mind.be>
References: <20161101141448.14792-1-arnout@mind.be>
Message-ID: <20161101153620.3b040c9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Nov 2016 15:14:48 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +# The configure scripts finds PYSITEDIR as the python_lib directory of
> +# host-python, and then prepends DESTDIR in front of it. So we end up
> +# installing things in $(TARGET_DIR)/$(HOST_DIR)/usr/lib/python which is
> +# clearly wrong.
> +# Patching owfs to do the right thing is not trivial, it's much easier to
> +# override the PYSITEDIR variable in make. That, in turn, is easier to do by
> +# setting OWFS_MAKE, otherwise both OWFS_INSTALL_STAGING_OPTS and
> +# OWFS_INSTALL_TARGET_OPTS would have to be overridden
> +OWFS_MAKE = $(MAKE) PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages

Could we instead introduce a OWFS_MAKE_OPTS variable? Yes, that's a
slightly larger change, but it's our usual pattern to handle such
situations, so I'd prefer to have it handled like this in owfs as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
