From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:07:37 +0200
Subject: [Buildroot] [PATCH] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <1411110831-27676-3-git-send-email-jeremy.rosen@openwide.fr>
References: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
 <1411110831-27676-3-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140921200737.740f2bc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Fri, 19 Sep 2014 09:13:51 +0200, J?r?my Rosen wrote:
> the cmake detection script provided with cmake will first look for a
> binary called swig2.0 then for a binary called swig
> 
> swig-host only installs a binary called swig and gets overridden by the
> version installed by the host distro. This symlink prevents that from
> happening

I don't understand the explanation: if it looks for a binary called
swig, then where's the need to create a swig2.0 symbolic link? How a
binary in $(HOST_DIR)/usr/bin can get overridden by the version
installed by the host distro?

The SoB line is missing.

> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index 5efc81c..233e97d 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -15,4 +15,10 @@ HOST_SWIG_CONF_OPT = \
>  SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
>  SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
>  
> +define SWIG_INSTALL_SYMLINK

Should be HOST_SWITCH_INSTALL_SYMLINK.

I've marked your patch as "Changes requested" in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
