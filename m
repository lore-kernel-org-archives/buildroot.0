From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 02:13:52 +0200
Subject: [Buildroot] [PATCH v7 8/9] support/scripts: relocate-sdk.sh now
 creates sdk-location in share/buildroot
In-Reply-To: <1499273594-12106-9-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-9-git-send-email-wg@grandegger.com>
Message-ID: <bef9133f-5751-15fa-5580-29bcf41dba6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 18:53, Wolfgang Grandegger wrote:
> This is because $(HOST_DIR)/usr is gone.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Can be applied right away.

 Regards,
 Arnout

> ---
>  support/misc/relocate-sdk.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
> index 2a9ebc9..729353a 100755
> --- a/support/misc/relocate-sdk.sh
> +++ b/support/misc/relocate-sdk.sh
> @@ -5,7 +5,7 @@ if [ "$#" -ne 0 ]; then
>      exit 1
>  fi
>  
> -LOCFILE="usr/share/buildroot/sdk-location"
> +LOCFILE="share/buildroot/sdk-location"
>  FILEPATH="$(readlink -f "$0")"
>  NEWPATH="$(dirname "${FILEPATH}")"
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
