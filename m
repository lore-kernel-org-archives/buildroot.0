From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jan 2007 15:06:18 +0100
Subject: [Buildroot] libintl_gettext errors at end of build??
In-Reply-To: <20070123192841.6sa6ze5j404ckcks@www.smittys.pointclark.net>
References: <20070123192841.6sa6ze5j404ckcks@www.smittys.pointclark.net>
Message-ID: <20070124140618.GB10837@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2007 at 07:28:41PM -0500, joe at smittys.pointclark.net wrote:
>Hello,
>No matter what versions I choose I keep getting ": undefined reference  
>to `libintl_gettext'" error at the very end of the build. I tried to  
>build gettext into the build thinking this would solve the problem but  
>no go, still comes up. Looks like it is looking for it in the kernel  
>build config area? Anyone know why this is happening and how to  
>correct it?
>
>Thanks - Joe
>
>
>

>make[1]: Entering directory `/root/buildroot/build_i686/linux-2.6.19.2'
>   HOSTLD  scripts/kconfig/conf
>scripts/kconfig/conf.o(.text+0x93): In function `check_stdin':
>: undefined reference to `libintl_gettext'

Well sounds like you need gettext on the build-host installed.
You could add a host-gettext to the gettext.mk that installs into the
toolbuild_dir and use that if you do not want or can not install the gettext
that comes with your distro..

HTH,
