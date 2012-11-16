From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 16 Nov 2012 15:54:23 +0100
Subject: [Buildroot] Buildroot fail to build when configure for dev
 managment: dynamically with udev
In-Reply-To: <50A65094.7080202@ronetix.at>
References: <50A65094.7080202@ronetix.at>
Message-ID: <50A6539F.8040507@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/16/2012 03:41 PM, Martin Peevski wrote:
> Hi,
>
>     I tryed to build Buildroot with only rootfs, I have already built 
> Kernel image. Use external toolchain for the building. I configure 
> Buildroot for dynamically /dev managment with udev but during udev 
> building I got the following errors:
>
> src/udev-builtin-input_id.c: In function 'test_key':
> src/udev-builtin-input_id.c:165: error: 'BTN_TRIGGER_HAPPY' undeclared 
> (first use in this function)
> src/udev-builtin-input_id.c:165: error: (Each undeclared identifier is 
> reported only once
> src/udev-builtin-input_id.c:165: error: for each function it appears in.)
> make[4]: *** [src/udevadm-udev-builtin-input_id.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [all-recursive] Error 1
> make[2]: *** [all] Error 2
> make[1]: *** 
> [/home/martin/Desktop/sam9x5-linux-sources/rootfs/build/udev-182/.stamp_built] 
> Error 2
> make: *** [all] Error 2
>
>      Can you, please, give me some advices?
>


Hi Martin,

what version of kernel headers the toolchain uses? Most likely to 
problem will be around the kernel header version...

-- 
br,
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
