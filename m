From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 21:11:29 +0100
Subject: [Buildroot] [PATCH 0/5] Add Xilinx ZynqMP and ZCU106 board
 support
In-Reply-To: <CAKmqyKPCKhWpm+z4P0-LMtu8c6VXpsq5cUecACYEsC1QbRhKoQ@mail.gmail.com>
 (Alistair Francis's message of "Sat, 27 Jan 2018 10:59:52 -0800")
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
 <87372rir1r.fsf@dell.be.48ers.dk>
 <CAKmqyKPCKhWpm+z4P0-LMtu8c6VXpsq5cUecACYEsC1QbRhKoQ@mail.gmail.com>
Message-ID: <87r2qbf4em.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alistair" == Alistair Francis <alistair23@gmail.com> writes:

Hi,

 >> It would be nice if Xilinx could host these officially. How do they do
 >> it for Yocto?

 > We don't have anything nice for Yocto either. The files are behind a
 > click-through license so users have to manually download them.

 > There are instructions here:
 > https://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/meta-xilinx-bsp/README.qemu.md

But isn't this README about the 32KB pmu boot rom code, and not the
runtime loadable pmu fw that you can build from the embeddedsw repo?

 > I don't think hosting the files is a good idea. That puts you are risk
 > for export compliance violations.

I agree for the rom code, but that shouldn't be needed to run on a
zcu106 board?

>> > Finally, U-Boot needs some tweaks in order for the PMU firmware to
 >> > properly loaded and to initialize peripherals before starting
 >> > Linux. This is done in patch 4.
 >> 
 >> Is this now the offical supported boot flow from Xilinx? I haven't
 >> followed in details, but when I assisted with a Zynqmp based project
 >> last year they used Xilinx fsbl and bootgen instead of u-boot SPL.

 > It's not officially supported. It is what meta-xilinx uses for QEMU boot though.

Ok. Luca, any specific reason why you are using this for real hw?

Alistair, do you know if bootgen is downloadable somewhere separately?

-- 
Bye, Peter Korsgaard
