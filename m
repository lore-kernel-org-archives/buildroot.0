From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 15:31:20 +0100
Subject: [Buildroot] [PATCH v3 3/3] skeleton: Pretty fixes for
 /etc/profile
In-Reply-To: <1443881664-9100-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443881664-9100-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443881664-9100-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <560FE6B8.9090303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 15:14, Maxime Hadjinlian wrote:
> Fix indent and put PATH on a single line.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Verified that patch is whitespace-only except for the removed \.


 Regards,
 Arnout

> ---
>  system/skeleton/etc/profile | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index c40a311..df0be7f 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -1,13 +1,9 @@
> -export PATH=\
> -/bin:\
> -/sbin:\
> -/usr/bin:\
> -/usr/sbin
> +export PATH=/bin:/sbin:/usr/bin:/usr/sbin
>  
>  if [ "`id -u`" -eq 0 ]; then
> -    export PS1='# '
> +	export PS1='# '
>  else
> -    export PS1='$ '
> +	export PS1='$ '
>  fi
>  
>  export PAGER='/bin/more '
> @@ -15,8 +11,8 @@ export EDITOR='/bin/vi'
>  
>  # Source configuration files from /etc/profile.d
>  for i in /etc/profile.d/*.sh ; do
> -    if [ -r "$i" ]; then
> -        . $i
> -    fi
> -    unset i
> +	if [ -r "$i" ]; then
> +		. $i
> +	fi
> +	unset i
>  done
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
