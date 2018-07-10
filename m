From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 22:59:49 +0200
Subject: [Buildroot] [PATCH v4]
 configs/olimex_a10_olinuxino_lime_defconfig: new board
In-Reply-To: <1531143985-17072-1-git-send-email-leon.anavi@konsulko.com>
References: <1531143985-17072-1-git-send-email-leon.anavi@konsulko.com>
Message-ID: <0b298d00-9505-2fa5-7577-f0d0636050fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Leon,

On 09-07-18 15:46, Leon Anavi wrote:
> Add a defconfig for the Olimex A10-OLinuXino-LIME, reusing most
> of the A20-OLinuXino-Lime and A13-OLinuXino files (sym links).
> 
> The configurations for Olimex A10-OLinuXino-LIME feature:
> - U-Boot 2018.03
> - Mainline Linux kernel 4.14.26
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>

[snip]
> diff --git a/board/olimex/a10_olinuxino/readme.txt b/board/olimex/a10_olinuxino/readme.txt
> new file mode 100644
> index 0000000..ba4bf69
> --- /dev/null
> +++ b/board/olimex/a10_olinuxino/readme.txt
> @@ -0,0 +1,57 @@
> +A10-OLinuXino-LIME
> +
> +Intro
> +=====
> +
> +These are open hardware boards, all based on the Allwinner A10 SoC.

 Personally, I would have made the entire directory a symlink to the a20
directory and I would have merged the two readme's into one. But there's
something to be said for copying it as well, so I've kept it like this.

[snip]
> +++ b/configs/olimex_a10_olinuxino_lime_defconfig
> @@ -0,0 +1,48 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a8=y
> +#BR2_ARM_EABIHF=y

 This commented-out line is not needed. Yes, it's still there in the a20
defconfigs, but that's just because we defaulted to softfloat ABI a while ago.
Those EABIHF=y lines are actually redundant in all defconfigs.

 Applied to master with that changed, thanks.

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
