From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Apr 2014 13:46:52 +0300
Subject: [Buildroot] libwebsockets : missing header
In-Reply-To: <385326490C3E4FFE925925E70428D1E5@JohanW7>
References: <385326490C3E4FFE925925E70428D1E5@JohanW7>
Message-ID: <20140429104652.GN4531@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert Johan,

On Tue, Apr 29, 2014 at 12:11:39PM +0200, Sagaert Johan wrote:
> building libwebsockets is broken :
>  
> snip..........
> -g -rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\"
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\"
> -DLWS_BUILD_HASH=\"dd06dc8\" -MT libwebsockets_la-output.lo -MD -MP -MF .deps/libwebsockets_la-output.Tpo -c output.c  -fPIC -DPIC
> -o .libs/libwebsockets_la-output.o
> libtool: compile:  /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -std=gnu99 -pedantic -O0 -g
> -rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\" -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\" -DLWS_BUILD_HASH=\"dd06dc8\" -MT
> libwebsockets_la-libwebsockets.lo -MD -MP -MF .deps/libwebsockets_la-libwebsockets.Tpo -c libwebsockets.c  -fPIC -DPIC -o
> .libs/libwebsockets_la-libwebsockets.o
> libtool: compile:  /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -std=gnu99 -pedantic -O0 -g
> -rdynamic -fPIC -Werror -c -DINSTALL_DATADIR=\"/usr/share\" -DLWS_OPENSSL_CLIENT_CERTS=\"/etc/pki/tls/certs/\" -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_DEBUG -DLWS_LIBRARY_VERSION=\"1.2\" -DLWS_BUILD_HASH=\"dd06dc8\" -MT
> libwebsockets_la-base64-decode.lo -MD -MP -MF .deps/libwebsockets_la-base64-decode.Tpo -c base64-decode.c  -fPIC -DPIC -o
> .libs/libwebsockets_la-base64-decode.o
> libwebsockets.c:32:21: fatal error: ifaddrs.h: No such file or directory
>  #include <ifaddrs.h>
>                      ^
> Maybe this has been reported before. 
> I found that this header file is not present in the staging include directory but is located
> in the uclibc-0.9.33.2/include build directory.

Please share your .config.

Have you customized the uClibc configuration?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
