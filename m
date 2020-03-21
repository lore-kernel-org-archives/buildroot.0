From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 15:32:59 +0100
Subject: [Buildroot] [PATCH 3/6] configs/stm32mp157a_dk1: new defconfig
In-Reply-To: <20200321133222.1393674-3-b.bilas@grinn-global.com>
References: <20200321133222.1393674-1-b.bilas@grinn-global.com>
 <20200321133222.1393674-3-b.bilas@grinn-global.com>
Message-ID: <20200321153259.4f386e8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Sat, 21 Mar 2020 14:32:19 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index cde757681e..22448e1028 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -320,6 +320,7 @@ solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
>  stm32f429_disco_defconfig: { extends: .defconfig }
>  stm32f469_disco_defconfig: { extends: .defconfig }
>  stm32mp157c_dk2_defconfig: { extends: .defconfig }
> +stm32mp157a_dk1_defconfig: { extends: .defconfig }

You should use "make .gitlab-ci.yml" to generate this file. Indeed
here, alphabetic ordering was not correct. Fixed when applying.

> diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
> new file mode 100644
> index 0000000000..95c834e431
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config

I was wondering if a common Linux configuration file would be possible,
perhaps with just an extra fragment for the DK2 to enable display/WiFi
support.

> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> new file mode 100644
> index 0000000000..e9db685271
> --- /dev/null
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -0,0 +1,32 @@
> +

Useless empty line here. Fixed when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
