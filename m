From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 09:01:59 +0100
Subject: [Buildroot] [PATCH] zedboard: add Avnet Zedboard support.
In-Reply-To: <CAEBucnCGPO1aHe8o0HctLgW2saX3havxJBSf42A4hO2tSJk_+A@mail.gmail.com>
References: <1391724285-23135-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <878utnnb8s.fsf@dell.be.48ers.dk>
 <CAEBucnCGPO1aHe8o0HctLgW2saX3havxJBSf42A4hO2tSJk_+A@mail.gmail.com>
Message-ID: <20140207090159.41b96ed3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 6 Feb 2014 16:28:03 -0600, Spenser Gilliland wrote:

> > What about u-boot?
> 
> Building u-boot for the zed board is not difficult the problem is the
> convoluted wrapper which requires the XIlinx tools in order to install
> it.  I can add directions to the readme.
> 
> The basic process is.
> 
> source <path/to/xilinx/settings.sh>
> cat <<EOF > boot.bif
> {
>    [bootloader]<path/to/fsbl.elf>
>    <path/to/system.bit>
>    <path/to/uboot.elf>
> }
> bootgen -image boot.bif -o i BOOT.BIN
> 
> This file then needs to be placed on the SD Card.

Since we're building u-boot, I believe it makes sense to indicate in
the README how to use it. Could you send a followup patch, now that the
initial board support has been merged?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
