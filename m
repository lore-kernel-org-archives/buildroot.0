From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 23:13:32 +0100
Subject: [Buildroot] [PATCH 2/3] package/open62541: fix library version
 definition
In-Reply-To: <20210220162715.283519-2-fancp2007@gmail.com>
References: <20210220162715.283519-1-fancp2007@gmail.com>
 <20210220162715.283519-2-fancp2007@gmail.com>
Message-ID: <20210220221332.GT2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scott, All,

On 2021-02-21 00:27 +0800, Scott Fan spake thusly:
> Manually specified version must start with letter 'v',
> otherwise, the generated version macro will be zero
> in the <build_dir>/src_generated/open62541/config.h file:
>   #define UA_OPEN62541_VER_MAJOR 0
>   #define UA_OPEN62541_VER_MINOR 0
>   #define UA_OPEN62541_VER_PATCH 0
> 
> Reference from the following link:
> https://open62541.org/doc/current/building.html
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/open62541/open62541.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 65742e83a1..3f75196817 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -19,7 +19,7 @@ OPEN62541_LICENSE_FILES = LICENSE
>  OPEN62541_CONF_OPTS = \
>  	-DCMAKE_BUILD_TYPE=Release \
>  	-DGIT_EXECUTABLE=NO \
> -	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
> +	-DOPEN62541_VERSION=v$(OPEN62541_VERSION) \
>  	-DUA_ENABLE_HARDENING=OFF
>  
>  ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
