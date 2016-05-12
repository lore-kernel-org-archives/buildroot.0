From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 15:28:54 +0200
Subject: [Buildroot] [PATCH 3/9] package/go-bootstrap: Set CC to host CC
In-Reply-To: <14cc3c8334b20ed8b9f5510556a4b83dc4f85e55.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <14cc3c8334b20ed8b9f5510556a4b83dc4f85e55.1463010771.git.geoff@infradead.org>
Message-ID: <20160512152854.56c727f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:

> diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
> index 1ced355..5dc839a 100644
> --- a/package/go-bootstrap/go-bootstrap.mk
> +++ b/package/go-bootstrap/go-bootstrap.mk
> @@ -20,6 +20,7 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
>  	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> +	CC=$(HOSTCC_NOCCACHE) \

Why do you use HOSTCC_NOCCACHE instead of just HOSTCC ? Is the usage of
ccache a problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
