From: Mark Corbin <mark.corbin@embecosm.com>
Date: Mon, 25 Feb 2019 09:40:51 +0000
Subject: [Buildroot] RISCV64 kernel panic: cannot open root device
In-Reply-To: <CAOsEZohYzt=r5oVXruxhxaCg6pc_5rfE5YiyedbWpQE1wE96+A@mail.gmail.com>
References: <CAOsEZohYzt=r5oVXruxhxaCg6pc_5rfE5YiyedbWpQE1wE96+A@mail.gmail.com>
Message-ID: <71c97124-5823-3c33-aff1-79af765a749e@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jay

On 25/02/2019 09:03, Jay Aurabind wrote:
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

At the moment RISC-V still requires a custom kernel. You need to choose
'custom git repository' for your kernel version and set...

URL of custom repository -> https://github.com/riscv/riscv-linux.git
Custom repository version -> 8fe28cb58bcb235034b64cbbb7550a8a43fd88be

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
