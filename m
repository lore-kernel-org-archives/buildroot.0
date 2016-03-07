From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 11:05:56 +0100
Subject: [Buildroot] [PATCH] tor: disable unit-tests for aarch64
In-Reply-To: <20160307032730.GA7775@waldemar-brodkorb.de>
References: <20160307032730.GA7775@waldemar-brodkorb.de>
Message-ID: <20160307110556.6fc64de1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Mon, 7 Mar 2016 04:27:31 +0100, Waldemar Brodkorb wrote:
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/13ef47c962afefbaa9ea7a95de083f885f1a8825/
> 
> There still might be a bug outside the unit-test.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> ---
> Bug reported upstream:
> https://trac.torproject.org/projects/tor/ticket/18490
> 
> ---
>  package/tor/tor.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index f6874a6..efd0d8d 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -32,6 +32,12 @@ else
>  TOR_CONF_OPTS += --disable-seccomp
>  endif
>  
> +# aarch64 toolchain triggers a code problem, message is misleading
> +# relocation truncated to fit: R_AARCH64_LDST64_ABS_LO12_NC against symbol
> +ifeq ($(BR2_aarch64),y)
> +TOR_CONF_OPTS += --disable-unittests
> +endif

I think we should disable unittests globally, as we generally don't
build test programs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
