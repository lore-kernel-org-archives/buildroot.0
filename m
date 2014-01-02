From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 10:15:51 +0100
Subject: [Buildroot] [PATCH 1/1] transmission: version bump to 2.8.2
In-Reply-To: <BLU0-SMTP836DDC88AF848215E0249AD9CE0@phx.gbl>
References: <BLU0-SMTP836DDC88AF848215E0249AD9CE0@phx.gbl>
Message-ID: <20140102101551.2a562563@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 30 Dec 2013 18:41:23 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
>  package/transmission/transmission.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> index 1e7ee48..3ced558 100644
> --- a/package/transmission/transmission.mk
> +++ b/package/transmission/transmission.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TRANSMISSION_VERSION = 2.33
> +TRANSMISSION_VERSION = 2.82
>  TRANSMISSION_SITE = http://download.transmissionbt.com/files/
>  TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
>  TRANSMISSION_DEPENDENCIES = \

This patch is causing lots of build issues in our autobuilders. See
http://autobuild.buildroot.org/results/638/63884de929fb7339ebf44b08cb5d1ab30010666a/build-end.log
for an example. The build error is:

tr-utp.c:66:1: error: conflicting types for 'UTP_Write'
In file included from tr-utp.c:28:0:
../third-party/libutp/utp.h:116:6: note: previous declaration of 'UTP_Write' was here
make[2]: *** [tr-utp.o] Error 1
make[2]: *** Waiting for unfinished jobs....

Can you have a look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
