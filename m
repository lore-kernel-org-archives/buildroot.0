From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 7 May 2009 05:44:51 +0200
Subject: [Buildroot] [PATCH] .gitignore: Add download directory 'dl'
In-Reply-To: <1241649940-16168-1-git-send-email-mroth@nessie.de>
References: <1241649940-16168-1-git-send-email-mroth@nessie.de>
Message-ID: <200905070544.51649.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael Roth, 07.05.2009:
> (And additionally, ease /binaries pattern.)

Yes, the current /binaries/* hid the directory, but completely removed
it by "git-clean -d", which should not be intended.

> Signed-off-by: Michael Roth <mroth@nessie.de>
> ---
>  .gitignore |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 4a2de4e..e7117d3 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,7 +1,8 @@
>  /build_*
>  /project_*
>  /toolchain_*
> -/binaries/*
> +/binaries
> +/dl
>  /.auto.deps
>  /.config.cmd
>  /.config.old

What about additionally adding /.config* ?
I guess it's quite common to have some configs laying around.

Markus
