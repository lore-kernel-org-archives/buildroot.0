From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Aug 2016 07:58:45 +0200
Subject: [Buildroot] [PATCH] boa: boa.conf: run under the nogroup group
In-Reply-To: <1472162021-3722-1-git-send-email-peter@korsgaard.com>
References: <1472162021-3722-1-git-send-email-peter@korsgaard.com>
Message-ID: <516e797c-0688-80d6-8d60-81d19b4c3138@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-08-16 23:53, Peter Korsgaard wrote:
> The default boa.conf we install specifies that boa should run under the
> nobody group, but we don't have such a group in our default skeleton (and
> boa doesn't add it), causing boa to fail to start:
>
> [01/Jan/1970:00:00:10 +0000] No such group: nobody
>
> Instead use the nogroup group, which is presumably what was meant.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (not runtime tested though)

 Regards,
 Arnout

> ---
>  package/boa/boa.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/boa/boa.conf b/package/boa/boa.conf
> index f51c237..e940296 100644
> --- a/package/boa/boa.conf
> +++ b/package/boa/boa.conf
> @@ -46,7 +46,7 @@ Port 80
>  # Group: The group name or GID the server should run as.
>  
>  User nobody
> -Group nobody
> +Group nogroup
>  
>  # ServerAdmin: The email address where server problems should be sent.
>  # Note: this is not currently used, except as an environment variable



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
