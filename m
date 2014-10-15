From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Oct 2014 14:18:02 +0200
Subject: [Buildroot] [PATCH v3] manual: Add note about uses of github
 helper
In-Reply-To: <1413279197-11949-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413279197-11949-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <543E65FA.4080206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/14 11:33, Maxime Hadjinlian wrote:
> Add a little comment regarding the uses of the github helper for the releases.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
> v1 -> v2:
>   - Remove typo
>   - Add indication to uses green button's link
> ---
>  docs/manual/adding-packages-tips.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 0d4fcb0..9896a9b 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -52,3 +52,17 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
>    Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
>    so it is not necessary to specify it in the +.mk+ file.
>  - When using a commit ID as version, you should use the full 40 hex characters.
> +
> +If the package you wish to add does have a release section on GitHub,
> +you need to be careful, the maintainer of the package may have
> +uploaded a specific file along with the releases.

 Sorry, still not clear enough for me :-). I'm going to repost, that's easier
than commenting here.

 Regards,
 Arnout

> +You can see it from the pages:
> +- If there is a green download button, like
> +  https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2], you
> +  should uses the link of that button to specify +FOO_SITE+.
> +- If there is grey downlaod button, like
> +  https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then you
> +  can use the 'github' helper.
> +
> +If there is a green download button, it should be used in priority over
> +the grey one.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
