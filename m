From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:44:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/thrift: drop unneeded static
 openssl workaround
In-Reply-To: <20190413083858.12941-1-fontaine.fabrice@gmail.com>
References: <20190413083858.12941-1-fontaine.fabrice@gmail.com>
Message-ID: <06a15c77-f0e9-68b5-febf-f0588ebbdb8b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2019 10:38, Fabrice Fontaine wrote:
> thrift uses pkg-config to find openssl dependencies such as lz or
> latomic so drop unneeded workaround
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks. I've checked, this was already added in the first
commit adding thrift.

 Regards,
 Arnout

> ---
>  package/thrift/thrift.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index 8a284229a1..6014bbfcdd 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -31,8 +31,6 @@ endif
>  
>  # thrift doesn't use the regular flags BUILD_{STATIC,SHARED}_LIBS
>  ifeq ($(BR2_STATIC_LIBS),y)
> -# openssl uses zlib, so we need to explicitly link with it when static
> -THRIFT_CONF_ENV += LIBS=-lz
>  THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=ON -DWITH_BOOST_STATIC=ON -DWITH_SHARED_LIB=OFF
>  else ifeq ($(BR2_SHARED_LIBS),y)
>  THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=OFF -DWITH_BOOST_STATIC=OFF -DWITH_SHARED_LIB=ON
> 
