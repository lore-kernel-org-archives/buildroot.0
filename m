From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Apr 2016 00:58:48 +0200
Subject: [Buildroot] [PATCH 2/4] linux-headers: indent custom choices
In-Reply-To: <1461099155-30702-3-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-3-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <5716B828.2070008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/16 22:52, Vivien Didelot wrote:
> Fix the indentation of config entries in the "Custom kernel headers
> series" choice menu.

  We currently have 5 choice statements where the contents is indented, and 54 
where it's not. So I wouldn't say that we usually indent it...

  That said, I'm not strictly against indenting choice contents: it's not going 
to be nested any deeper, and the lines are normally not that long. The only 
question is what to do with the help texts, because they would suddenly have to 
be wrapped at 82 characters...

>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>   package/linux-headers/Config.in.host | 160 +++++++++++++++++------------------
>   1 file changed, 80 insertions(+), 80 deletions(-)
>
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 9f80224..6d86113 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -99,112 +99,112 @@ choice
>   	  This is used to hide/show some packages that have strict
>   	  requirements on the version of kernel headers.
>
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
> -	bool "4.5.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
> +		bool "4.5.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
