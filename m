From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 29 Apr 2014 23:38:04 +0200
Subject: [Buildroot] libwebsockets : missing header
In-Reply-To: <20140429104652.GN4531@tarshish>
References: <385326490C3E4FFE925925E70428D1E5@JohanW7>
 <20140429104652.GN4531@tarshish>
Message-ID: <CC6264431B404C22BA31EFBB1A84BE98@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Baruch

You pointed me in the right direction, I am using a custom uclibc config file.
UCLIBC_SUPPORT_AI_ADDRCONFIG was not set in my config file.

Best Regards, Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Baruch Siach
Verzonden: dinsdag 29 april 2014 12:47
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] libwebsockets : missing header

Hi Sagaert Johan,

On Tue, Apr 29, 2014 at 12:11:39PM +0200, Sagaert Johan wrote:
> building libwebsockets is broken :
>  
> snip..........
> -g -rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\"
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\"
> -DLWS_BUILD_HASH=\"dd06dc8\" -MT libwebsockets_la-output.lo -MD -MP 
> -MF .deps/libwebsockets_la-output.Tpo -c output.c  -fPIC -DPIC -o 
> .libs/libwebsockets_la-output.o
> libtool: compile:  /home/brcpy/output/host/usr/bin/ccache 
> /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -Wall -std=gnu99 -pedantic -O0 -g -rdynamic 
> -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" 
> -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\" -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG 
> -DLWS_LIBRARY_VERSION=\"1.2\" -DLWS_BUILD_HASH=\"dd06dc8\" -MT 
> libwebsockets_la-libwebsockets.lo -MD -MP -MF 
> .deps/libwebsockets_la-libwebsockets.Tpo -c libwebsockets.c  -fPIC 
> -DPIC -o .libs/libwebsockets_la-libwebsockets.o
> libtool: compile:  /home/brcpy/output/host/usr/bin/ccache 
> /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -Wall -std=gnu99 -pedantic -O0 -g -rdynamic 
> -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" 
> -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\" -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG 
> -DLWS_LIBRARY_VERSION=\"1.2\" -DLWS_BUILD_HASH=\"dd06dc8\" -MT 
> libwebsockets_la-base64-decode.lo -MD -MP -MF 
> .deps/libwebsockets_la-base64-decode.Tpo -c base64-decode.c  -fPIC 
> -DPIC -o .libs/libwebsockets_la-base64-decode.o
> libwebsockets.c:32:21: fatal error: ifaddrs.h: No such file or 
> directory  #include <ifaddrs.h>
>                      ^
> Maybe this has been reported before. 
> I found that this header file is not present in the staging include 
> directory but is located in the uclibc-0.9.33.2/include build directory.

Please share your .config.

Have you customized the uClibc configuration?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il - _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
