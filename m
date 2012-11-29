From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 29 Nov 2012 12:38:51 +0000
Subject: [Buildroot] [PATCH 18/33] linux-fusion: bump to version 8.10.4
In-Reply-To: <1353543503-8952-19-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-19-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHt8ZCOHDmb1bb8+5kLpDtJSM84Uy1Br0Zb3P_h7DaqiSBkxnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 November 2012 00:18, Samuel Martin <s.martin49@gmail.com> wrote:
> Also fix directfb build avoiding the following error to occur
> (since FCEF_FOLLOW has been added in linux-fusion-8.9.0):
>
> libtool: compile:  /opt/br/output/host/usr/bin/ccache /opt/br/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../.. -I../../include -I../../lib -I../../include -I../../lib -DDATADIR=\"/usr/share/directfb-1.4.17\" -DMODULEDIR=\"/usr/lib/directfb-1.4-6\" -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -ffast-math -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -g2 -g3 -fno-inline -Wno-inline -D_GNU_SOURCE -finstrument-functions -std=gnu99 -Werror-implicit-function-declaration -MT call.lo -MD -MP -MF .deps/call.Tpo -c call.c  -fPIC -DPIC -o .libs/call.o
> call.c: In function 'fusion_call_execute3':
> call.c:311:66: error 'FCEF_FOLLOW' undeclared (first use in this function)
> call.c:311:66: note: each undeclared identifier is reported only once for each function it appears in
> call.c: In function 'fusion_world_flush_calls':
> call.c:444:54: error 'FCEF_FOLLOW' undeclared (first use in this function)
> make[5]: *** [call.lo] Error 1
> make[5]: Leaving directory `/opt/br/output/build/directfb-1.4.17/lib/fusion'
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/linux-fusion/linux-fusion.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
 (built-test on a minimal arm config)
