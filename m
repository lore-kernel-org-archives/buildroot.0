From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:19:30 +0100
Subject: [Buildroot] [PATCH] package/efivar: add upstream post-37
 patches fixing efibootmgr -v
In-Reply-To: <20210317204335.30705-1-peter@korsgaard.com>
References: <20210317204335.30705-1-peter@korsgaard.com>
Message-ID: <20210320221930.2ef6e752@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 21:43:34 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Without this patch, efibootmgr -v errors out:
> 
> efibootmgr -v
> BootCurrent: 0001
> Timeout: 1 seconds
> BootOrder: 0001,0002,0000
> Boot0000* Diagnostic ProgramCould not parse device path: Invalid argument
> 
> vs:
> 
> efibootmgr -v
> BootCurrent: 0001
> Timeout: 1 seconds
> BootOrder: 0001,0002,0000
> Boot0000* Diagnostic Program    FvVol(5c60f367-a505-419a-859e-2a4ff6ca6fe5)/FvFile(085e8cc2-8ec9-4666-bd2a-49d481e95fa7)
> Boot0001* containeros-a HD(1,GPT,1491d519-d9d7-7c4e-9110-4ab21271ac64,0x800,0x20000)/File(\efi\container\boot.efi)
> 
> For more details, see:
> 
> https://github.com/rhboot/efibootmgr/issues/133
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=963475
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0005-ucs2.h-remove-unused-variable.patch  | 35 +++++++++++++++++++
>  ...-that-checks-for-UCS-2-string-termin.patch | 32 +++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 package/efivar/0005-ucs2.h-remove-unused-variable.patch
>  create mode 100644 package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
