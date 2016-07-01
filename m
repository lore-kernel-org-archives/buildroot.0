From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:08:53 +0200
Subject: [Buildroot] [PATCH v6 2/6] libsemanage: bump to version 2.5
In-Reply-To: <1466980753-667-3-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-3-git-send-email-Aduskett@gmail.com>
Message-ID: <20160701110853.77713b57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 18:39:09 -0400, Adam Duskett wrote:

> -LIBSEMANAGE_VERSION = 2.1.10
> -LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +LIBSEMANAGE_VERSION = 2.5
> +LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
>  LIBSEMANAGE_LICENSE = LGPLv2.1+
>  LIBSEMANAGE_LICENSE_FILES = COPYING
> -LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
> +LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2

When you add a dependency to a .mk file, you must also take it into
account in the Config.in file by selecting the package. And when you do
this, you need to replicate the "depends on" of the selected package in
the current package.

I've fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
