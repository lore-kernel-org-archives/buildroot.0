From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:12:52 +0200
Subject: [Buildroot] [PATCH 4/9] package/go: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <62cf6f9a00fe67cf999e45f7cbf4bf2e295a0fd5.1463010771.git.geoff@infradead.org>
Message-ID: <20160512161252.7471bf1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:
> CGO needs thread support.  Fixes build errors like these:
> 
>   warning requested reentrant code, but thread support was disabled
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/go/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 094e402..e988483 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>  	bool
>  	default y
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

This is not an architecture dependency, it's a toolchain dependency. We
normally show a comment about such a dependency so that users know they
need to enable thread support in their toolchain.

When you say "CGO needs thread support", is CGO the go runtime on the
target? Does this means that any Go program needs threads?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
