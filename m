From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 19 Oct 2007 09:03:17 +0200
Subject: [Buildroot] Semi OT - LZMA
In-Reply-To: <47181CCC.3070208@gmail.com>
References: <47181CCC.3070208@gmail.com>
Message-ID: <20071019070317.GA14101@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 18, 2007 at 11:56:12PM -0300, Rex Luscus wrote:
> 
> Somebody know why the lzma algorithm it's not in mainline kernel yet?

There are three different aspects:

 - LZMA compressed squashfs - this was the first kernel patches
   including lzma I found.

 - LZMA compressed kernel (vmlinuz) - The first (and only) patches I've
   seen and used was made by Ming-Ching Tiew after I asked around.

   These patches works at least on i386 and ARM.

 - LZMA compressed initramfs and initrd - Same as with vmlinuz.

   I tried to port this to ARM aswell (or rather, make one generic
   all-platform patch) but hit problems with the missing FPU.

The first one lives it's own life (away from me at least) and the latter
two has started their own life aswell. I haven't seen any generic
versions yet but someone may have made them. They should be generic
before we try to send them to mainline.

And the way to do that should be through the Tinylinux patches. They
have Mortons attention now.

I Don't know about more than these patches but please enoughten me if
I'm blind.

Thomas.
