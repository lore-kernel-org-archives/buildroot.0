From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 4 Apr 2018 13:46:27 -0300 (BRT)
Subject: [Buildroot] [PATCH] iqvlinux: remove package
In-Reply-To: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
References: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
Message-ID: <582573602.1626193.1522860387654.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Buildroot List" <buildroot@uclibc.org>
> Cc: "Romain Naour" <romain.naour@gmail.com>, "Carlos Santos" <casantos@datacom.ind.br>, "Thomas Petazzoni"
> <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, April 4, 2018 1:00:09 PM
> Subject: [PATCH] iqvlinux: remove package

> This package contains a kernel module from Intel, which could only be
> used together with Intel userspace tools provided under NDA, which
> also come with the same kernel module. The copy of the kernel module
> available on SourceForge is only provided only to comply with the
                              ,^^^^
"only" is repeated here ------

> GPLv2 requirement. Intel engineers were even surprised it even built
> and were not willing to make any effort to fix their tarball naming to
> contain a version number. Therefore, it does not make sense for
> Buildroot to provide such a package.
> 
> See https://sourceforge.net/p/e1000/bugs/589/ for the discussion.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Config.in.legacy                                   | 18 ++++++
> DEVELOPERS                                         |  1 -
> package/Config.in                                  |  1 -
> .../0001-Support-Linux-kernel-4.12-and-later.patch | 66 ----------------------
> package/iqvlinux/Config.in                         | 21 -------
> package/iqvlinux/iqvlinux.hash                     |  6 --
> package/iqvlinux/iqvlinux.mk                       | 25 --------
> 7 files changed, 18 insertions(+), 120 deletions(-)
> delete mode 100644
> package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
> delete mode 100644 package/iqvlinux/Config.in
> delete mode 100644 package/iqvlinux/iqvlinux.hash
> delete mode 100644 package/iqvlinux/iqvlinux.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 2e3b1b6001..45ad79e4b1 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,24 @@ endif
> ###############################################################################
> comment "Legacy options removed in 2018.05"
> 
> +config BR2_PACKAGE_IQVLINUX
> +	bool "iqvlinux packaged removed"
> +	select BR2_LEGACY
> +	help
> +	  This package contained a kernel module from Intel, which
> +	  could only be used together with Intel userspace tools
> +	  provided under NDA, which also come with the same kernel
> +	  module. The copy of the kernel module available on
> +	  SourceForge is only provided only to comply with the GPLv2
                        ,^^^^
and here ---------------

Except by those small details,

Acked-by: Carlos Santos <casantos@datacom.ind.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
