From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Aug 2017 21:51:29 +0200
Subject: [Buildroot] [PATCH 2/2] configs/imx6q-sabresd_qt5: Remove
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
In-Reply-To: <1503339652-7641-2-git-send-email-fabio.estevam@nxp.com>
References: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
 <1503339652-7641-2-git-send-email-fabio.estevam@nxp.com>
Message-ID: <8ad9ada1-92ec-c928-4924-2019e7694027@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-08-17 20:20, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> Selecting CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y causes touchscreen
> to behave incorrectly, leading to missed touch events, so remove this
> option.

 The default *is* performance, so removing the line will set it to performance.
So I double-checked and indeed, I get the same .config before and after your patch.

 Am I missing something?

 I added that line to make it explicit what is selected, which apparently was a
good idea :-)

 Regards,
 Arnout

> 
> Keep the fragment file as sent in the original patch submission.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx6q-sabresd/linux_qt5.fragment | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/board/freescale/imx6q-sabresd/linux_qt5.fragment b/board/freescale/imx6q-sabresd/linux_qt5.fragment
> index 5c0505e..f244ba8 100644
> --- a/board/freescale/imx6q-sabresd/linux_qt5.fragment
> +++ b/board/freescale/imx6q-sabresd/linux_qt5.fragment
> @@ -1,4 +1,3 @@
>  # Currently kernel mainline exhibits issues when running cpufreq as ondemand
>  # governor on mx6.
>  # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> -CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
