From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 00:11:28 +0100
Subject: [Buildroot] [PATCH 1/5] Microblaze: added architecture support
	for both big endian and low endian
In-Reply-To: <4F5CD748.8050100@relinux.de>
References: <4F5CD748.8050100@relinux.de>
Message-ID: <201203140011.29137.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 11 March 2012 17:48:08 Stephan Hoffmann wrote:
> From: Alvaro G. M <alvaro.gamez@hazent.com>
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  target/Config.in.arch |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/target/Config.in.arch b/target/Config.in.arch
> index 25c6e50..83f128f 100644
> --- a/target/Config.in.arch
> +++ b/target/Config.in.arch
> @@ -21,6 +21,10 @@ config BR2_i386
>  config BR2_m68k
>  	bool "m68k"
>  	depends on BROKEN # ice in uclibc / inet_ntoa_r
> +config BR2_microblazeel
> +	bool "microblazeel"
> +config BR2_microblazebe
> +	bool "microblazebe"

 I would prefer the prompts to be a bit more descriptive, e.g.

config BR2_microblazeel
	bool "Microblaze (little-endian)"

 I realize that the other architectures all have cryptic names and no 
help text, but that doesn't mean we should do the same for new 
architectures.


 [snip]


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
