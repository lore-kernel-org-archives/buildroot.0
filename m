From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 19:56:09 +0200
Subject: [Buildroot] [RFC 4/4] genimage.sh: add usage to die function
In-Reply-To: <20170418155554.28732-5-etienne.phelip@savoirfairelinux.com>
References: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
 <20170418155554.28732-5-etienne.phelip@savoirfairelinux.com>
Message-ID: <0984e944-0208-e5df-6ac7-90cbab2994c1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Ah, sorry, I won't ack it :-)

On 18-04-17 17:55, Etienne Phelip wrote:
> This also re-indents the die function using tabulations.
> 
> Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
> ---
>  support/scripts/genimage.sh | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
> index 50d6907..d0d3491 100755
> --- a/support/scripts/genimage.sh
> +++ b/support/scripts/genimage.sh
> @@ -1,8 +1,11 @@
>  #!/bin/bash
>  
>  die() {
> -  echo "Error: $@" >&2
> -  exit 1
> +	echo "Usage: ${0##*/} BINARIES_DIR -c GENIMAGE_CFG" >&2
> +	echo "" >&2
> +

 This empty line is not needed IMO.

> +	echo "Error: $@" >&2

 IMO Error should come first, then usage.

 And of course, to be compatible with Abhimanyu's patch, BINARIES_DIR should be
left out.

 Regards,
 Arnout

> +	exit 1
>  }
>  
>  GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> @@ -18,7 +21,7 @@ while getopts :c: OPT ; do
>  	esac
>  done
>  
> -[ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
> +[ -n "${GENIMAGE_CFG}" ] || die "missing option 'c'"
>  
>  rm -rf "${GENIMAGE_TMP}"
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
