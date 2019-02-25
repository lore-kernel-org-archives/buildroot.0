From: Jay Aurabind <jay.aurabind@gmail.com>
Date: Mon, 25 Feb 2019 14:37:00 +0530
Subject: [Buildroot] RISCV64 kernel panic: cannot open root device
In-Reply-To: <CAOsEZohYzt=r5oVXruxhxaCg6pc_5rfE5YiyedbWpQE1wE96+A@mail.gmail.com>
References: <CAOsEZohYzt=r5oVXruxhxaCg6pc_5rfE5YiyedbWpQE1wE96+A@mail.gmail.com>
Message-ID: <CAOsEZojXmBRAYdjtGkZNm2SJgTeJowVrwrsO0H7AeNpGd0Kj-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, there was an omission in the qemu command line I sent in the
previous message. I tried with both:

-append "root=/dev/vda ro console=ttyS0"
-append "console=ttyS0"

On Mon, 25 Feb 2019 at 14:33, Jay Aurabind <jay.aurabind@gmail.com> wrote:
>
> Hi,
>
> I built 2018.11.2 version of buildroot with config https://pastebin.com/eSPt939r
>
> I am getting a kernel panic due to "VFS: Cannot open root device "vda"
> or unknown-block(0,0): error -6". Full kernel log:
> https://pastebin.com/9zdZDDtR
>
> The command used for launching qemu is:
>
> qemu-system-riscv64 -nographic -machine virt -kernel output/images/bbl
>   -append "console=ttyS0"     -drive
> file=output/images/rootfs.ext2,format=raw,id=hd0     -device
> virtio-blk-device,drive=hd0   -netdev user,id=net0    -device
> virtio-net-device,netdev=net0
>
> What could be wrong?
>
> --
>
> Thanks and Regards,
> Aurabindo J



-- 

Thanks and Regards,
Aurabindo J
