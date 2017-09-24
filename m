From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:02:45 +0200
Subject: [Buildroot] [PATCH] docs: clarify <packagename>_PATCH behaviour
In-Reply-To: <20170914144742.1844-1-alexander.i.mukhin@gmail.com>
References: <20170914144742.1844-1-alexander.i.mukhin@gmail.com>
Message-ID: <d03be58d-55c5-6970-688e-2a19c2df8634@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 16:47, Alexander Mukhin wrote:
> Reiterate once more that <packagename>_PATCH variable can point
> to an arbitrary URL, not just to a path relative to <packagename>_SITE.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

 Applied to master, thanks. I also added a sentence to say that the patch should
be added to the hash file.

 Regards,
 Arnout

> ---
>  docs/manual/patch-policy.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index e1df8b003..5e2e5fc4b 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -19,9 +19,11 @@ global patch directory.
>  ==== Downloaded
>  
>  If it is necessary to apply a patch that is available for download, then add it
> -to the +<packagename>_PATCH+ variable. It is downloaded from the same site
> -as the package itself. It can be a single patch, or a tarball containing a
> -patch series.
> +to the +<packagename>_PATCH+ variable. If an entry contains +://+,
> +then Buildroot will assume it is a full URL and download the patch
> +from this location. Otherwise, Buildroot will assume that the patch should be
> +downloaded from +<packagename>_SITE+. It can be a single patch,
> +or a tarball containing a patch series.
>  
>  This method is typically used for packages from Debian.
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
