From: bifferos <bifferos@yahoo.co.uk>
Date: Mon, 12 Mar 2012 14:46:16 +0000
Subject: [Buildroot] [PATCH v2] bifferboard: new board
In-Reply-To: <1331463508-1810-1-git-send-email-arnout@mind.be>
References: <20120305104929.00b97692@skate>
 <1331463508-1810-1-git-send-email-arnout@mind.be>
Message-ID: <4F5E0C38.9080901@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2012 10:58 AM, Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>
>
> Includes linux and busybox config (to make it fit in 1MB).
>
> Based on
> https://sites.google.com/site/bifferboard/Home/boards-with-1mb-flash/buildroot
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>
You can run the generated image in the emulator with something like this:

git clone git://github.com/bifferos/bb.git
cd bb/qemu
./configure
make
cd ..
wget 
http://bifferos.co.uk/downloads/bifferboard/qemu/biffboot-3_6-qemu.bin 
-O bios.bin
dd if=/dev/zero of=flash.bin bs=1024 count=16
./tools/make_config_block.py 0x20 config.bin
cat config.bin >> flash.bin
cat ../buildroot-2011.11/output/images/bzImage >> flash.bin
./qemu/i386-softmmu/qemu -cpu 486 -m 32 -vga none -nographic -bios 
./bios.bin -firmware flash.bin

PATCH v2 still gives the backtrace error, however if you try the bzImage 
from 
https://sites.google.com/site/bifferboard/Home/boards-with-1mb-flash/buildroot 
(attached at the bottom), it works OK.

Incidentally, thanks for your help with this.

Biff.
