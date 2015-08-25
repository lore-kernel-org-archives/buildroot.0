From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 11:50:27 +0200
Subject: [Buildroot] [PATCH 1/1] erlang-p1-tls: add missing dependency
 to openssl
In-Reply-To: <1440495924-18788-1-git-send-email-johan.oudinet@gmail.com>
References: <1440495924-18788-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150825115027.33547a1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue, 25 Aug 2015 11:45:24 +0200, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang-p1-tls/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
> index 42c6a3e..0df3348 100644
> --- a/package/erlang-p1-tls/Config.in
> +++ b/package/erlang-p1-tls/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_ERLANG_P1_TLS
>  	bool "erlang-p1-tls"
> +	select BR2_PACKAGE_OPENSSL

What about the dependency in the .mk file? Doing a "select" in
Config.in does not guarantee that the dependency will be built before
that package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
