From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:19:57 +0100
Subject: [Buildroot] [PATCH 02/13] docs/manual: rephrase part about
 rebuilding packages
In-Reply-To: <1393167879-16637-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223151957.GD3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> There is no need to tell people should remove stamp files: they should
> use the make <pkg>-reconfigure and make <pkg>-rebuild make targets
> instead. We still keep an explanation about stamp files, just to give
> to the user an insight on how Buildroot works internally.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/rebuilding-packages.txt | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index da8d230..4872e88 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -51,23 +51,25 @@ its build directory in +output/build+. Buildroot will then re-extract,
>  re-configure, re-compile and re-install this package from scratch. You
>  can ask buildroot to do this with the +make <package>-dirclean+ command.
>  
> -For convenience, the special make targets
> -<package>-reconfigure and <package>-rebuild repeat the configure
> -resp. build steps.
> -
> -However, if you don't want to rebuild the package completely from
> -scratch, a better understanding of the Buildroot internals is
> -needed. Internally, to keep track of which steps have been done and
> -which steps remain to be done, Buildroot maintains stamp files (empty
> -files that just tell whether this or that action has been done):
> -
> -* +output/build/<package>-<version>/.stamp_configured+. If removed,
> -  Buildroot will trigger the recompilation of the package from the
> -  configuration step (execution of +./configure+).
> -
> -* +output/build/<package>-<version>/.stamp_built+. If removed,
> -  Buildroot will trigger the recompilation of the package from the
> -  compilation step (execution of +make+).
> +On the other hand, if you only want to restart the build process of a
> +package from its compilation step, you can run +make
> +<package>-rebuild+, followed by +make+ or +make <package>+. It will
> +restart the compilation and installation of the package, but not from
> +scratch: it basically simply re-executes +make+ and +make install+
> +inside the package, so it will only rebuild files that changed.
> +
> +If you want to restart the build process of a package from its
> +configuration step, you can run +make <package>-reconfigure+, followed
> +by +make+ or +make <package>+. It will restart the configuration,
> +compilation and installation of the package.
> +
> +Internally, Buildroot creates so-called _stamp files_ to keep track of
> +which build steps have been completed for each package. They are
> +stored in the package build directory,
> ++output/build/<package>-<version>/+ and are named
> ++.stamp_<step-name>+. The commands detailed above simply manipulate
> +these stamp files to force Buildroot to restart a specific set of
> +steps of a package build process.
>  
>  Further details about package special make targets are explained in
>  xref:pkg-build-steps[].
> -- 
> 1.8.3.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
