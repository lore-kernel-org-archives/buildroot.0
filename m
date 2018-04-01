From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 1 Apr 2018 09:58:26 -0500
Subject: [Buildroot] [PATCH] ppc64 e5500 arch: new qemu target
In-Reply-To: <20180401163906.0de5ab39@windsurf>
References: <1522592130-25157-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CANQCQpZu=s0ovBMLsQYLhAk8kPB3AfN_qCDutkSyV_+K0MAAPQ@mail.gmail.com>
 <20180401163906.0de5ab39@windsurf>
Message-ID: <CANQCQpZi=-OHkn5KcisKWOHjEG+Bto8gzKZS+R0fpV1SuF8yeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Apr 1, 2018 at 9:39 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Sun, 1 Apr 2018 09:25:47 -0500, Matthew Weber wrote:
>
>> > diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
>> > new file mode 100644
>> > index 0000000..81993d2
>> > --- /dev/null
>> > +++ b/board/qemu/ppc64-e5500/linux.fragment
>> > @@ -0,0 +1,2 @@
>> > +# Enables generic e500 arch support for QEMU
>> > +CONFIG_PPC_QEMU_E500=y
>> > diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
>> > new file mode 100644
>> > index 0000000..8da23f9
>> > --- /dev/null
>> > +++ b/board/qemu/ppc64-e5500/readme.txt
>> > @@ -0,0 +1,7 @@
>> > +Run the emulation with:
>> > +
>> > + qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -append 'console=ttyS0 root=/dev/ram' -initrd output/images/rootfs.cpio.gz -serial mon:stdio -nographic
>> > +
>>
>> This arch seems like it had good support back to QEMU 2.0.0.  However,
>> I'll be submitting a bootlin e6500 arch variant toolchain but I'm
>> still working out what version of QEMU can even boot that arch.  As of
>> 2.11.x support hasn't been merged.
>
> I don't get it. In the same paragraph you say "it had good support back
> to Qemu 2.0.0" and  "as of 2.11.x support hasn't been merged".
>

The e5500 has good support in 2.0.0 but I've been looking at adding a
new e6500 which does not.

Matt
