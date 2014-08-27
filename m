From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 27 Aug 2014 12:09:16 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-08-26
In-Reply-To: <53FDACA0.7080501@posteo.de>
References: <20140827063010.1F56610167A@stock.ovh.net>
 <53FDACA0.7080501@posteo.de>
Message-ID: <53FDBC5C.7030603@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/27/2014 11:02 AM, J?rg Krause wrote:
>
> On 08/27/2014 08:30 AM, Thomas Petazzoni wrote:
>> Build statistics for 2014-08-26
>> ===============================
>>
>>
>>        bfin | libshairplay-139d5ef5556451... | NOK |
>> http://autobuild.buildroot.net/results/7b13728386da6179608a1c7607565bd9bc357d86/
>>
>
> This is a problem with missing or not finding libdl. This is what my
> libshairplay/config.log shows:
>
> configure:11508:
> /home/joerg/Freescale/buildroot/output/host/usr/bin/bfin-uclinux-gcc -o
> conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -pipe -Os   -Wl,-elf2flt -static
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -elf2flt -static conftest.c -ldl   >&5
> /home/joerg/Freescale/buildroot/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real:
> cannot find -ldl
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Could be something related with this?:

(static linking is broken with -ldl)

http://lists.uclibc.org/pipermail/uclibc/2010-September/044300.html

-- 
Vincent
