From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 23 Nov 2016 15:49:39 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <CAM+bi4ujUpa+BEtU8XAC1sCW2AoM8gUhT-Rtg8xWs-_O8KTF6A@mail.gmail.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
 <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
 <20161123130636.5b362a27@free-electrons.com>
 <CAM+bi4ujUpa+BEtU8XAC1sCW2AoM8gUhT-Rtg8xWs-_O8KTF6A@mail.gmail.com>
Message-ID: <CAM+bi4sYT51Qc72s1bpsRw8K3mOPRjMtYC171YOms1L_PG0R7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-23 13:16 GMT+01:00 Alvaro Gamez <alvaro.gamez@hazent.com>:

> /home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/micr
> oblazeel-buildroot-linux-gnu/4.9.3/../../../../microblazeel-buildroot-linux-gnu/bin/ld:
> xilisf_read.o: unknown relocation type 30
>

Comparing the output of readelf over xilisf_read.o as compiled by
Xilinx toolchain and with buildroot's toolchain.

Under Xilinx':
00000000  0000001e R_MICROBLAZE_32_NONE              c

Under buildroots':
00000000  0000001e unrecognized: 1e                 c

I've searched for the R_MICROBLAZE_32_NONE string and there's only this
thing on google:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/plain/recipes-microblaze/gdb/files/0014-LOCAL-Fixup-debug_loc-sections-after-linker-relaxati.patch

So, I can understand that Xilinx may have patched something but the
question is:
how come buildroot's toolchain is generating a relocation entry with value
30 (1e),
when this relocation number doesn't exist on buildroot's toolchain?
I've grepped for both 30 and 1e around the codebase of the BSP and there's
no
reference to this value.

This looks like black magic to me...

Best regards!



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161123/c3831d11/attachment.html>
