From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jun 2018 22:06:39 +0200
Subject: [Buildroot] [PATCH 1/1] More complete usage string.
In-Reply-To: <20180605123959.21925-1-F.LaRoche@pilz.de>
References: <20180605123959.21925-1-F.LaRoche@pilz.de>
Message-ID: <e3d565da-4f03-65d8-dca2-dc5c0e195911@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [+ Carlos who is working on init scripts]

On 05-06-18 14:39, Florian La Roche wrote:
> More complete usage string for the logging service.
> 
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
>  package/busybox/S01logging | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/S01logging b/package/busybox/S01logging
> index 4632a4cc99..fcb3e7d236 100644
> --- a/package/busybox/S01logging
> +++ b/package/busybox/S01logging
> @@ -33,7 +33,7 @@ case "$1" in
>  	start
>  	;;
>    *)
> -	echo "Usage: $0 {start|stop|restart}"
> +	echo "Usage: $0 {start|stop|restart|reload}"

 For this one, we should perhaps first decide on what we want to do in general
with the init scripts. Do we want to define a reload target? And if we do, and
it is equal to the restart target, do we want to have it in the help text?

 First some statistics. We currently have:

- 109 init scripts
-  75 define 'reload', 12 define 'force-reload', 6 both (so 81 total)
-  63 define 'reload' as 'restart'
-   7 define 'reload' as something else
- 107 provide help text
-  31 provide help text for 'reload'
-  13 of the 63 that define reload == restart provide help text for reload
-   7 of the 7 that define reload != restart provide help text for reload


 So my proposal for the "norm" would be:

- always defines reload
- only document reload if reload != restart
- decide what to do with force-reload later

 Carlos, what do you think?


 In short, I would not apply this patch.

 Regards,
 Arnout

>  	exit 1
>  esac
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
