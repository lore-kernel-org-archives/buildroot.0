From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:09:09 +0200
Subject: [Buildroot] [PATCH 15/15] docs/manual: add a section about
 SELinux
In-Reply-To: <20200731101040.1723047-16-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-16-antoine.tenart@bootlin.com>
Message-ID: <20200904150909.3b3fbff0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Antoine,

On Fri, 31 Jul 2020 12:10:40 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> +== Using +SELinux+ in Buildroot
> +
> +https://selinuxproject.org[SELinux] is a Linux kernel security module enforcing
> +access control policies. In addition to the traditional file permissions and
> +access control lists, +SELinux+ allows to write rules for users or processes to
> +access specific functions of resources (files, sockets...).
> +
> ++SELinux+ has three modes of operating: +Enforcing+, +Permissive+ and
> ++Disabled+.  If not +Disabled+, the kernel will apply the policy and
> +non-authorized actions will be denied in +Enforcing+ mode or logged and reported
> +in +Permissive+ mode.  +Permissive+ mode is often used for troubleshooting
> +SELinux issues. In Buildroot this is controlled by the
> ++BR2_PACKAGE_REFPOLICY_POLICY_STATE_*+ configuration options.

I reformatted this paragraph a bit, and pointed to SELinux kernel
options as suggested by Adam.

> +By default in Buildroot the +SELinux+ policy is provided by the upstream
> +https://github.com/SELinuxProject/refpolicy[refpolicy] project, enabled with
> ++BR2_PACKAGE_REFPOLICY+.
> +
> +[[enabling-selinux]]
> +=== Enabling SELinux support
> +
> +To have proper support for +SELinux+ in a Buildroot generated system, the
> +following configuration needs to be enabled:
> +
> +* +BR2_PACKAGE_REFPOLICY+
> +* +BR2_PACKAGE_POLICYCOREUTILS+

policycoreutils is not mandatory. However, libselinux is, so I've
replaced BR2_PACKAGE_POLICYCOREUTILS by BR2_PACKAGE_LIBSELINUX.

> +The Linux kernel configuration must also enable +SELinux+ support with
> ++CONFIG_SECURITY_SELINUX+, +CONFIG_LSM+ (or using the +lsm+ kernel
> +parameter) and extended attributes in filesystems (+CONFIG_EXT2_FS_XATTR+ for
> ++ext2+, +CONFIG_SQUASHFS_XATTR+ for +squashfs+, etc...).

I've dropped this paragraph since kernel options are taken care of, and
the extended attributes support will be taken care of by the patch
series from Adam.

Final commit:

  https://git.buildroot.org/buildroot/commit/?id=c38c1cde0d8b3e58643407edef7eb0e06a70b8de

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
