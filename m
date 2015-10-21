From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Oct 2015 12:14:32 +0300
Subject: [Buildroot] [PATCH v2] board/freescale: switch
 create-boot-sd.sh to parted
In-Reply-To: <1445417826-9634-1-git-send-email-vincent.stehle@freescale.com>
References: <CAAMH-ysuKMKY6AXbtJqALq0jr3fs1-j0e_Pf=Qrm8BvUuTimKg@mail.gmail.com>
 <1445417826-9634-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20151021091432.GE2650@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Oct 21, 2015 at 10:57:06AM +0200, Vincent Stehl? wrote:
> Starting with version 2.26, sfdisk defaults to a unit of 512 B sectors.
> With those recent versions of sfdisk, the create-boot-sd.sh script ends
> up creating a boot partition of 240 KB, which is too small to contain a
> Linux kernel.
> 
> As it is difficult to address both pre and post v2.26 sfdisk versions in
> a single command, we change the create-boot-sd.sh script to use parted
> instead. While at it, we set the boot partition size to 64 MB, which
> should be enough for everyone.

You should mention in the relevant readme.txt files under board/freescale/ 
that parted needs to be installed on the host.

Alternatively, you can enable host-parted in the config files, and use that in 
create-boot-sd.sh.

> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
