From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 8 Dec 2016 14:48:38 -0800
Subject: [Buildroot] [PATXH v3 2/2] package/xen: Disable strict
 unused-const-variable checking
In-Reply-To: <20161208220648.3361d86d@free-electrons.com>
References: <1481227872-31723-1-git-send-email-alistair.francis@xilinx.com>
 <1481227872-31723-3-git-send-email-alistair.francis@xilinx.com>
 <20161208220648.3361d86d@free-electrons.com>
Message-ID: <CAKmqyKMFZSUoqVn82M1YQcUwzZbJNTEDwcNe26f5fp2hXcb=GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 8, 2016 at 1:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 8 Dec 2016 12:11:12 -0800, Alistair Francis wrote:
>
>> + CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
>> +-    -Wno-declaration-after-statement -Wformat-nonliteral
>> ++    -Wno-declaration-after-statement -Wformat-nonliteral \
>> ++    -Werror=unused-const-variable=0
>
> Sorry for not catching this earlier, but what we want instead is to
> completely remove -Werror. It's pointless for releases, and is causing
> to cause other build failures.

No worries, I have removed the -Werror. I left the other ones in there though.

Thanks,

Alistair

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
