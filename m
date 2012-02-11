From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:12:10 +0100
Subject: [Buildroot] [PATCH 3/3] .gitignore: remove wrong entries
In-Reply-To: <1328918676-19482-4-git-send-email-felipe.contreras@gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <1328918676-19482-4-git-send-email-felipe.contreras@gmail.com>
Message-ID: <201202111712.10582.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 11 February 2012 01:04:36 Felipe Contreras wrote:
> These should go into a personal file, like:
> core.excludesfile=/home/felipec/.gitignore
>   .*.sw[nop]
> 
> Some people might prefer to see patches, rejects and other files in the
> output of 'git status' (e.g. me).

 Agreed on most parts, except for the /*.patch.  It was added because git
format-patch creates them.  If they are not ignored, than git add -A won't
work properly anymore.

 While we're talking about gitignore: I have two more things I'd like to
add to it:

/output* (because I often use parallel output dirs within the buildroot
directory, as it gives me access to git).

/defconfig (since it's a generated file).

 What do the others think?


 Regards,
 Arnout


> 
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> ---
>  .gitignore |    7 -------
>  1 files changed, 0 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 685a9c2..1a7d636 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -5,10 +5,3 @@
>  /.config.old
>  /..config.tmp
>  /.config
> -*.depend
> -*.o
> -/*.patch
> -/*.diff
> -*.orig
> -*.rej
> -*~
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
