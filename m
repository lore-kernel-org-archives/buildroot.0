From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:14:43 +0200
Subject: [Buildroot] [PATCH v3 4/6] package/go: Add HOST_GO_CGO_ENABLED
In-Reply-To: <aada378f523bb232ae4d0a23e09dc07c0aff40f0.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
 <aada378f523bb232ae4d0a23e09dc07c0aff40f0.1464286518.git.geoff@infradead.org>
Message-ID: <20160526211443.37850ebe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 18:21:33 +0000, Geoff Levand wrote:

> +# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
> +# set, build in cgo support for any go programs that may need it.  Note that
> +# any target package needing cgo support must include
> +# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
> +ifeq (BR2_TOOLCHAIN_HAS_THREADS,y)
> +	HOST_GO_CGO_ENABLED = 1

Such definitions are normally not indented, so I've fixed this here.

> +else
> +	HOST_GO_CGO_ENABLED = 0

and here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
