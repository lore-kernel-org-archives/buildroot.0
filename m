From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 20:52:25 +0200
Subject: [Buildroot] [PATCH/next 2/2] python-tornado: select
 python-backports-abc for Python 2.x only
In-Reply-To: <1463578504-1257-2-git-send-email-yegorslists@googlemail.com>
References: <1463578504-1257-1-git-send-email-yegorslists@googlemail.com>
 <1463578504-1257-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <b8848bf7-0828-170b-2510-c709e8fdd335@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/16 15:35, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> With the introduction of Pyton 3.5 python-backports-abc is only
> needed for Python 2.x.

  This patch should be squashed with the previous one, otherwise we have a 
non-working state in the middle.

  With that you can add my
  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-tornado/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
> index ac86682..3ead2af 100644
> --- a/package/python-tornado/Config.in
> +++ b/package/python-tornado/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_TORNADO
>  	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
>  	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
>  	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	# runtime
> +	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	if BR2_PACKAGE_PYTHON # runtime
>  	help
>  	  Tornado is a Python web framework and asynchronous networking
>  	  library, originally developed at FriendFeed.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
