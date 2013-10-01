From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2013 21:37:58 +0200
Subject: [Buildroot] [PATCH] pppd: needs mmu and shared objects
In-Reply-To: <1380532727.13663.1.camel@phoenix> (Axel Lin's message of "Mon,
 30 Sep 2013 17:18:47 +0800")
References: <1380532727.13663.1.camel@phoenix>
Message-ID: <87siwku6i1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> The plugin infrastructure is based on shared objects so it won't build
 Axel> for static-only scenarios.
 Axel> And the daemon uses fork() so MMU is required.

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel>  package/pppd/Config.in | 6 ++++++
 Axel>  1 file changed, 6 insertions(+)

 Axel> diff --git a/package/pppd/Config.in b/package/pppd/Config.in
 Axel> index 879b263..074c2fd 100644
 Axel> --- a/package/pppd/Config.in
 Axel> +++ b/package/pppd/Config.in
 Axel> @@ -1,10 +1,16 @@
 Axel>  config BR2_PACKAGE_PPPD
 Axel>  	bool "pppd"
 Axel> +	depends on !BR2_PREFER_STATIC_LIB
 Axel> +	depends on BR2_USE_MMU
 Axel>  	help
 Axel>  	  An implementation of the Point-to-point protocol.
 
 Axel>  	  http://www.samba.org/ppp/
 
 Axel> +comment "pppd requires a toolchain with dynamic library support"
 Axel> +	depends on BR2_PREFER_STATIC_LIB
 Axel> +	depends on BR2_USE_MMU
 Axel> +

This needs to go under the sub options otherwise they won't get properly
indented.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
