From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 08:12:55 +0100
Subject: [Buildroot] [PATCH] toolchain/wrapper: rename BR_DEBUG_WRAPPER
In-Reply-To: <1393887305-2252-1-git-send-email-yann.morin.1998@free.fr>
References: <1393887305-2252-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5316CE77.2030705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/14 23:55, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The user-facing variables should be prefixed with BR2_, not BR_.
> 
> Also quote the variable in the manual.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  docs/manual/customize-toolchain.txt                  | 2 +-
>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
> index 4f3fe23..55a0480 100644
> --- a/docs/manual/customize-toolchain.txt
> +++ b/docs/manual/customize-toolchain.txt
> @@ -21,7 +21,7 @@ When using an external toolchain, Buildroot generates a wrapper program,
>  that transparently passes the appropriate options (according to the
>  configuration) to the external toolchain programs. In case you need to
>  debug this wrapper to check exactly what arguments are passed, you can
> -set the environment variable BR_DEBUG_WRAPPER to either one of:
> +set the environment variable +BR2_DEBUG_WRAPPER+ to either one of:
>  
>  * +0+, empty or not set: no debug
>  
> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> index 81c6ed1..db49784 100644
> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
> @@ -191,7 +191,7 @@ int main(int argc, char **argv)
>  	 * set to 1          : trace all arguments on a single line
>  	 * set to 2          : trace one argument per line
>  	 */
> -	if ((env_debug = getenv("BR_DEBUG_WRAPPER"))) {
> +	if ((env_debug = getenv("BR2_DEBUG_WRAPPER"))) {
>  		debug = atoi(env_debug);
>  		if (debug > 0) {
>  			fprintf(stderr, "Toolchain wrapper executing:");
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
