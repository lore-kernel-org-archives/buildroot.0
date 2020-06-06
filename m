From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 14:04:41 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/linux-firmware: bump to
 version 20200519
In-Reply-To: <20200606034856.352224-1-christian@paral.in>
References: <20200606034856.352224-1-christian@paral.in>
Message-ID: <20200606120441.GE13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2020-06-05 20:48 -0700, Christian Stewart spake thusly:
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/linux-firmware/linux-firmware.hash | 2 +-
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> index 2ebd11365f..ff61306dd3 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256 83646c58fc4e3ee9a73f4fa74213c849109f48c719322346393f3e5b0fa55044 linux-firmware-20200122.tar.gz
> +sha256 8b343a14780c5d43dc225995203909bdcf7594755c93399d406daf511e27ee27 linux-firmware-20200519.tar.gz
>  sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
>  sha256 8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0 LICENSE.amdgpu
>  sha256 2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4 LICENCE.Marvell
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index cbad8d592a..b1c765dfae 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINUX_FIRMWARE_VERSION = 20200122
> +LINUX_FIRMWARE_VERSION = 20200519

    $ make linux-firmware-legal-info
    [...]
    ERROR: WHENCE has wrong sha256 hash:
    ERROR: expected: 74d203d2fd433b73b63e8e31d8928e3817f6eaf3407c9e607802c20a5c02e6c4
    ERROR: got     : affe0ad3fa08123ff33092233d299ab911a5c545993301e8d01b507dca4c8646

Can you fix that and respin a patch with the correct hash and a commit
log that explains what changed, please? For example:

  - changes to Files and Links definitions
  - covers new blobs and/or versions for various famillies (iwlwifi,
    brcmfmac, amdgpu, nvidia, etc...)

Regards,
Yann E. MORIN.

>  LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>  LINUX_FIRMWARE_SITE_METHOD = git
>  
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
