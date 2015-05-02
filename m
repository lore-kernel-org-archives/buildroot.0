From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 May 2015 00:05:40 +0200
Subject: [Buildroot] [PATCH 2/2] manual: Add notes about GitHub and
	hashes
In-Reply-To: <26c36e7fe8e11d2c3a75414a75daab0a65c59784.1430601733.git.yann.morin.1998@free.fr>
References: <cover.1430601733.git.yann.morin.1998@free.fr>
 <26c36e7fe8e11d2c3a75414a75daab0a65c59784.1430601733.git.yann.morin.1998@free.fr>
Message-ID: <55454A34.60002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 23:22, Yann E. MORIN wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> We can't take hashes from GitHub, unless the tarball has been uploaded by
> the maintainer, otherwise it is generated and may change over time,
> which renders hash files, useless.
                          spurious ,

> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 But the actual content is good, so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> v2-> v3 (YEM):
>   - move the block down, to be with with the other "note"
>   - add reference to the GitHub helper
>   - small gramatical fix s/automated/automatically/

 grammatical :-)

> 
> v1 -> v2:
>   - Add changes as requested by Yann E. Morin
>   - Reword the comment on released tarball
> ---
>  docs/manual/adding-packages-directory.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 1487891..3ae12ab 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -442,6 +442,13 @@ strong hash yourself (like +sha1+ or +sha256+, but not +md5+), and mention
>  this in a comment line above the hashes.
>  
>  .Note
> +If +libfoo+ is from GitHub (see xref:github-download-url[] for details), we
> +can only accept a +.hash+ file if the package is a released (e.g. uploaded
> +by the maintainer) tarball. Otherwise, the automatically generated tarball
> +may change over time, and thus its hashes may be different each time it is
> +downloaded, making the +.hash+ file irrelevant for that tarball.
> +
> +.Note
>  The number of spaces does not matter, so one can use spaces to
>  properly align the different fields.
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
