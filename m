From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Jun 2021 12:07:32 +0200
Subject: [Buildroot] [PATCH next] package/gnutls: disable tests
In-Reply-To: <6a855a1d0fd3bd8f4bd59d87e349ab52ea501eab.1622736642.git.baruch@tkos.co.il>
References: <6a855a1d0fd3bd8f4bd59d87e349ab52ea501eab.1622736642.git.baruch@tkos.co.il>
Message-ID: <f7d9d514-2788-9564-c51c-1936ced22f19@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2021 18:10, Baruch Siach wrote:
> Tests can't build with NDEBUG is defined. Since commit 5a8c50fe05afa
> ("core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set") NDEBUG
> is defined on !BR2_ENABLE_RUNTIME_DEBUG. Just disable tests.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9ec31793484a69c14a66b7338d795089c07b9937/
> http://autobuild.buildroot.net/results/6ef8f1534237f2df4cff0a0bc0364fe9a46a5343/
> http://autobuild.buildroot.net/results/05ff156687138627f244ca3f6cb58f1ce7d127c4/
> 
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gnutls/gnutls.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 14855bcebc8f..6fc9ffad0b3f 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -23,6 +23,7 @@ GNUTLS_CONF_OPTS = \
>  	--disable-guile \
>  	--disable-libdane \
>  	--disable-rpath \
> +	--disable-tests \
>  	--enable-local-libopts \
>  	--enable-openssl-compatibility \
>  	--with-librt-prefix=$(STAGING_DIR) \
> 
