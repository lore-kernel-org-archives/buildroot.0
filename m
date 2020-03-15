From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 15 Mar 2020 22:02:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/bearssl: needs -fPIC
In-Reply-To: <20200310194546.2347-1-fontaine.fabrice@gmail.com>
References: <20200310194546.2347-1-fontaine.fabrice@gmail.com>
Message-ID: <44641515-b85f-89b0-a188-0d427f708bc1@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 3/10/20 8:45 PM, Fabrice Fontaine wrote:
> Fixes:
>   - http://autobuild.buildroot.org/results/e677519c7536447062bf15fb7aa73eded19a6cf6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
>   package/bearssl/bearssl.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
> index e85626153c..ff5f4e87b7 100644
> --- a/package/bearssl/bearssl.mk
> +++ b/package/bearssl/bearssl.mk
> @@ -16,6 +16,7 @@ BEARSSL_MAKE_OPTS = \
>   
>   ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>   BEARSSL_TARGETS += dll
> +BEARSSL_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -fPIC"
>   endif
>   
>   ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> 

-- 
Giulio Benetti
Benetti Engineering sas
