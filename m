From: Drew Fustini <drew@beagleboard.org>
Date: Fri, 30 Apr 2021 01:51:14 -0700
Subject: [Buildroot] [PATCH 1/4] boot/opensbi: add support for version
 configuration
In-Reply-To: <20210429074636.724046-2-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <20210429074636.724046-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210430085114.GA183461@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 09:46:32AM +0200, Thomas Petazzoni wrote:
> OpenSBI contains platform-specific code, so very much like Linux,
> U-Boot or other bootloaders, using the upstream version of OpenSBI
> will very often not be sufficient.
> 
> This commit therefore adds the possibility of specifying a custom
> version of OpenSBI, either custom from upstream, custom tarball, or
> custom from Git. Support for other version control systems has not
> been implemented for now, but could be added later if needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/opensbi/Config.in  | 51 +++++++++++++++++++++++++++++++++++++++++
>  boot/opensbi/opensbi.mk | 19 ++++++++++++++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index b9b0ace8af..83f40f04fa 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -13,6 +13,57 @@ config BR2_TARGET_OPENSBI
>  	  https://github.com/riscv/opensbi.git
>  
>  if BR2_TARGET_OPENSBI
> +choice
> +	prompt "OpenSBI Version"
> +	help
> +	  Select the specific OpenSBI version you want to use
> +
> +config BR2_TARGET_OPENSBI_LATEST_VERSION
> +	bool "0.8"

I believe the latest version of OpenSBI is v0.9 [1].

Note that we currently have a bit of a confusing situation for the
BeagleV Starlight board. There are two repositories:

  * starfive-tech/sft-riscv-opensbi [2]
  * starfive-tech/beagle_opensbi [3]

Wei Fu is going to sort this out and declare which is the official repo
to use going forward.

Thanks,
Drew

[1] https://github.com/riscv/opensbi/releases/tag/v0.9
[2] https://github.com/starfive-tech/sft-riscv-opensbi
[3] https://github.com/starfive-tech/beagle_opensbi
