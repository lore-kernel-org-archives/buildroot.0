From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 4 Apr 2014 22:42:30 +0400
Subject: [Buildroot] host-binutils broken?
In-Reply-To: <533EED51.9090204@freescale.com>
References: <533EED51.9090204@freescale.com>
Message-ID: <CAMo8BfJhxpqBFmFeADF97cKbANtzNFYy2_L=wrMjLn8zUtinyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Fri, Apr 4, 2014 at 9:35 PM, Vincent Stehl?
<vincent.stehle@freescale.com> wrote:
> FYI it seems the following recent commit broke compilation of host-binutils
> (2.22 in my case) when compiling for e.g. raspberrypi_defconfig:
>
>   6acb2e1 binutils: backport gas xtensa jump trampolines
>
> If I revert it, host-binutils builds fine.

I couldn't reproduce it, the following steps complete successfully for me:

$ git checkout f90760fe0ed7317510bc6f44c5508e2072ed217d
$ mkdir ../build
$ make O=`pwd`/../build raspberrypi_defconfig
$ make O=`pwd`/../build toolchain

Could you please share your .config and build log?

-- 
Thanks.
-- Max
