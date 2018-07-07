From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:18:31 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: remove DOMOTICZ_CXXFLAGS
In-Reply-To: <20180707160918.1335-1-fontaine.fabrice@gmail.com>
References: <20180707160918.1335-1-fontaine.fabrice@gmail.com>
Message-ID: <194fd22b-61ae-7003-b194-f014f909d484@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-18 18:09, Fabrice Fontaine wrote:
> Since commit 6be346cec40dda8ab762e11471fa6ff951fdbfa0,
> DOMOTICZ_CXXFLAGS is not set anymore so remove it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/domoticz/domoticz.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
> index 6421fd0dd5..3d6cae4746 100644
> --- a/package/domoticz/domoticz.mk
> +++ b/package/domoticz/domoticz.mk
> @@ -27,8 +27,7 @@ DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
>  DOMOTICZ_CONF_OPTS += \
>  	-DUSE_BUILTIN_LUA=OFF \
>  	-DUSE_BUILTIN_SQLITE=OFF \
> -	-DUSE_BUILTIN_MQTT=OFF \
> -	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(DOMOTICZ_CXXFLAGS)"
> +	-DUSE_BUILTIN_MQTT=OFF
>  
>  ifeq ($(BR2_PACKAGE_LIBUSB),y)
>  DOMOTICZ_DEPENDENCIES += libusb
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
