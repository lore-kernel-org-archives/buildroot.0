From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 20:24:01 +0100
Subject: [Buildroot] [PATCH 1/9] skeleton/S40network: tweak for debian
 ifupdown
In-Reply-To: <1416330117-4458-2-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <546B9CD1.1070500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 18:01, Gustavo Zacarias wrote:
> Make the S40network script create the /run/network directory for the
> debian variant of ifupdown which uses it as a lock directory.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  system/skeleton/etc/init.d/S40network | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/system/skeleton/etc/init.d/S40network b/system/skeleton/etc/init.d/S40network
> index e69e613..bfdd491 100755
> --- a/system/skeleton/etc/init.d/S40network
> +++ b/system/skeleton/etc/init.d/S40network
> @@ -3,6 +3,9 @@
>  # Start the network....
>  #
>  
> +# Debian ifupdown needs the /run/network lock directory
> +mkdir -p /run/network
> +
>  case "$1" in
>    start)
>   	echo "Starting network..."
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
