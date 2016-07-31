From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2016 14:44:25 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <9e817dxthf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 30 Jul 2016 23:23:22 +0200 schrieb Thomas Petazzoni:

>>          arm | inotify-tools-1df9af4d6cd0f... | NOK | http://autobuild.buildroot.net/results/abcaf70523863a4cd096a1b063be2e742355849f/
> 
> inotifywait.c: In function 'output_event_csv':
> inotifywait.c:126:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
>      if (filename != NULL)
> 
> gcc 6.x build issue. Bernd, you are the last person who bumped this
> package. Could you investigate?

sent patch: http://patchwork.ozlabs.org/patch/654313/

>>          arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/8907e367345ac8ec16f118eb550810b4e758f0c3/
> 
> xsid.cpp:101:1: error: narrowing conversion of ''\200'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>  };
>  ^
> xsid.cpp:101:1: error: narrowing conversion of ''\224'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\251'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\274'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\316'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\341'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\362'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> 
> Bernd, this is your package.

Need to investigate more, but I am unsure whether I can fix
the bug with my limited C++ skills.

>>          arm |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/39e39de374414ffa07b6dc5f25c39dfb47cc8ad4/
> 
> ./vpx_mem/vpx_mem.h:17:19: fatal error: lddk.h: No such file or directory
> 
> Bernd ?

Sent patch: http://patchwork.ozlabs.org/patch/654323/
Most buildroot toolchains do not define __uClinux_, those who
do trigger the bug.

>>          arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/70da34c1528b51e92e9e60788f83733d70b33353/
> 
> In file included from /home/buildroot/autobuild/run/instance-2/output/build/openswan-2.6.46/lib/libopenswan/constants.c:1361:0:
> /home/buildroot/autobuild/run/instance-2/output/build/openswan-2.6.46/include/arpa/nameser.h:58:23: fatal error: sys/cdefs.h: No such file or directory
>  #include <sys/cdefs.h>
> 
> musl issue. Bernd, or Gustavo, you are the last ones who bumped this
> package, could you have a look?

Sent patch: http://patchwork.ozlabs.org/patch/654336/

>>      powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/12184cde82a405eb41356ce88918b2f28bc5c237/
> 
> net.c:40:24: fatal error: libutp/utp.h: No such file or directory
> 
> Bernd ?

Sent patch v2: http://patchwork.ozlabs.org/patch/654343/

>>     mips64el |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/349fb43101d4e780203baea1dac7ff4189bc28bb/
> 
> Bernd, this one is for you. I know you already sent a patch for this,
> which I didn't like. Do you think you will have some time to rework
> this patch?

Sent patch: http://patchwork.ozlabs.org/patch/654357/

Regards, Bernd
