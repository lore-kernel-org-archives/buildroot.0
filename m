From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 22:46:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] Fix -latomic for CMake packages
In-Reply-To: <20210415214448.669b3826@gmx.net>
References: <20210413060942.2530596-1-glex.spb@gmail.com>
 <20210413062615.2808309-1-glex.spb@gmail.com>
 <20210414194920.318e938d@gmx.net>
 <CADjhFRDs7oHBoAhbr96z9oHSEcfQnejec8LCE+_haOs5cwjXow@mail.gmail.com>
 <20210415214448.669b3826@gmx.net>
Message-ID: <8f6e2b20-c101-effa-9584-e9bd6a697721@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2021 21:44, Peter Seiderer wrote:
> Hello Gleb,
> 
> On Thu, 15 Apr 2021 04:49:29 +0100, Gleb Mazovetskiy <glex.spb@gmail.com> wrote:
> 
>> Hi Peter,
>>
>> The failing defconfig is here (it's specific to this buildroot):
>> https://github.com/batocera-linux/batocera.linux/blob/8d8038a6ddaae03f0150fd28a2d23c371156ebf2/configs/batocera-odroidgoa_defconfig
> 
> Thanks for providing the defconfig, as far as I can see nothing special (and no
> poppler enabled?), normal buildroot-glibc-gcc-10.x toolchain..., and I am not
> able to reproduce your problem (did only test without ccache)...

 CMake is known to do weird things with -isystem, and this can change over cmake
versions, and we use the host cmake if sufficiently recent. So that could make a
difference.

 Regards,
 Arnout

[snip]
