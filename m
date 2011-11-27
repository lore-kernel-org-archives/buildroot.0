From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 27 Nov 2011 18:49:47 +0100
Subject: [Buildroot] [PATCH 04/15] package: add
	<pkg>-rebuild	and	<pkg>-reconfigure
In-Reply-To: <4EB3B403.4020404@relinux.de>
References: <550d3ba3c9db7d0a9df78aa52e09da9af93e20d8.1314826231.git.thomas.petazzoni@free-electrons.com>
 <4EB3B403.4020404@relinux.de>
Message-ID: <4ED2783B.1010205@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No interest in this?
Am 04.11.2011 10:44, schrieb Stephan Hoffmann:
> Hello all,
>
> since I needed some time to find out this feature I submit this small
> patch for the documentation
> ("make help" and manual)
>
> Hope it helps other newbies:-)
>
> Kind regards
>
> Stephan
>
>
> From 3f8c5231d8773b00ae513859e0fa39c9986342f6 Mon Sep 17 00:00:00 2001
> From: Stephan Hoffmann <sho@relinux.de>
> Date: Fri, 4 Nov 2011 10:23:58 +0100
> Subject: [PATCH] Package: add documentation for rebuild et. al.
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>
> ---
>  Makefile                            |    2 ++
>  docs/manual/rebuilding-packages.txt |    3 +++
>  2 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 80ca587..c05bf3f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -639,6 +639,8 @@ help:
>         @echo
>         @echo 'Build:'
>         @echo '  all                    - make world'
> +       @echo '  <package>-rebuild      - force recompile <package>'
> +       @echo '  <package>-reconfigure  - force reconfigure <package>'
>         @echo
>         @echo 'Configuration:'
>         @echo '  menuconfig             - interactive curses-based
> configurator'
> diff --git a/docs/manual/rebuilding-packages.txt
> b/docs/manual/rebuilding-packages.txt
> index 9a41a88..910afa8 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -36,6 +36,9 @@ files are relevant:
>    Buildroot will trigger the recompilation of the package from the
>    compilation step (execution of +make+).
>  
> +The special make targets <package>-reconfigure and <package>-rebuild
> +can be used to automate this.
> +
>  For other packages, an analysis of the specific 'package.mk' file is
>  needed. For example, the zlib Makefile used to look like this (before
>  it was converted to the generic package infrastructure):


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
