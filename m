From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 18:45:15 +0200
Subject: [Buildroot] [PATCH] Fix typos
In-Reply-To: <20200830123610.20164-1-iulian.onofrei@yahoo.com>
References: <20200830123610.20164-1-iulian.onofrei.ref@yahoo.com>
 <20200830123610.20164-1-iulian.onofrei@yahoo.com>
Message-ID: <f4ca9546-83a2-fdb9-f3f8-0a7db0344943@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Iulian,

 Thank you for this patch. I wanted to apply this patch while fixing up the
comments below, but there's a fundamental problem...

On 30/08/2020 14:36, Iulian Onofrei via buildroot wrote:
> From: Iulian Onofrei <6d0847b9@opayq.com>

 There must be a Signed-off-by line for yourself.  This is a short way for you
to assert that you are entitled to contribute the patch under Buildroot's
GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

 If you don't have time to make proper patches according to my comments below,
you can just reply with the Signed-off-by line, and we can take it from there.


> 
> ---
>  package/libeXosip2/Config.in           | 4 ++--
>  package/nvidia-driver/nvidia-driver.mk | 4 ++--

 Please split into two patches, one per package. Also, the summary line should
include the package name. So:

package/libeXosip2: fix typo in help text
package/nvidia-driver: fix typo in comment


 Thanks!

 Regards,
 Arnout

>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
> index 4cb8218f20..9fbe9789f8 100644
> --- a/package/libeXosip2/Config.in
> +++ b/package/libeXosip2/Config.in
> @@ -4,10 +4,10 @@ config BR2_PACKAGE_LIBEXOSIP2
>  	select BR2_PACKAGE_LIBOSIP2
>  	help
>  	  eXosip is a library that hides the complexity of using the
> -	  SIP protocol for mutlimedia session establishement.
> +	  SIP protocol for multimedia session establishment.
>  	  This protocol is mainly to be used by VoIP telephony
>  	  applications (endpoints or conference server) but might be
> -	  also usefull for any application that wish to establish
> +	  also useful for any application that wish to establish
>  	  sessions like multiplayer games.
>  	  eXosip is based in libosip.
>  
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index baf2ba2be5..44e34cb7b4 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -35,7 +35,7 @@ NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
>  # NVidia extensions (which is deemed bad now), while the former follows
>  # the newly-introduced vendor-neutral "dispatching" API/ABI:
>  #   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
> -# However, this is not very usefull to us, as we don't support multiple
> +# However, this is not very useful to us, as we don't support multiple
>  # GL providers at the same time on the system, which this proposal is
>  # aimed at supporting.
>  #
> @@ -84,7 +84,7 @@ endef
>  # Those libraries are 'private' libraries requiring an agreement with
>  # NVidia to develop code for those libs. There seems to be no restriction
>  # on using those libraries (e.g. if the user has such an agreement, or
> -# wants to run a third-party program developped under such an agreement).
> +# wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
>  	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> 
