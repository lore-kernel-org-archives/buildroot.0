From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 29 Nov 2016 14:31:49 +0100
Subject: [Buildroot] [git commit] Update for 2016.11-rc3
In-Reply-To: <20161128225014.295707F8BF@busybox.osuosl.org>
References: <20161128225014.295707F8BF@busybox.osuosl.org>
Message-ID: <CAB0FRstpY7bqyGTp6zCaPm9Y7ADsGd3+p5Qk4JOJoLghWb+Caw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-28 23:48 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
> commit: https://git.buildroot.net/buildroot/commit/?id=93106e9e1fd2f722b92e3da9a0e6cc9a5a379cb2
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  CHANGES                    | 30 ++++++++++++++++++++++++++++++
>  Makefile                   |  2 +-
>  docs/website/download.html | 18 +++++++++---------
>  docs/website/news.html     | 22 ++++++++++++++++++++++
>  4 files changed, 62 insertions(+), 10 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index c4c063c..ddbb017 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,33 @@
> +2016.11-rc3, Released November 28th, 2016
> +
> +       Fixes all over the tree, including a number of security fixes.
> +
> +       The move from fakeroot to pseudo unfortunately brought a
> +       number of issues.  The SELinux issue described in #9386 which
> +       triggered the move to pseudo has been investigated further and
> +       a workaround implemented and the pseudo changes reverted.
> +
> +       Linux kernel: update default to 4.8.11.
> +
> +       Defconfigs: Updates/fixes for imx28ek, mx6udoo, imx6ulpico,
> +       olimex a20 olinuxino lime malo, roseapplepi, synopsis aarch64

typo s/malo/mali/

> +       vdk, axs101, axs103 and hs38 smd vdk.
> +
> +       Updated/fixed packages: autossh, chrony, dosfstools,
> +       dtv-scan-tables, e2fsprogs, gcc, gdb, gnuchess, gnuradio,
> +       gpsd, gst1-plugins-bad, gst1-plugins-good, imagemagick,
> +       kvm-unit-tests, libfribi, libuv, mesa3d, mpfr, mplayer, mpv,
> +       ntp, ola, olsr, openblas, openjpeg, openssh, postgresql,
> +       ptpd2python3, qemu, qextserialport, qt5base, quagga, xqwt,
> +       taskd, tiff, tremor, trousers, udisks, uclibc, wireshark,
> +       xapp_xload, xenomai, xmlstarlet
> +
> +       Issues resolved (http://bugs.buildroot.org):
> +
> +       #9386: ubinize fails with or without custom config
> +       #9431: A misspelling
> +       #9446: make raspberrypi3_defconfig compilation failure
> +
>  2016.11-rc2, Released November 13th, 2016
>
>         Fixes all over the tree.
> diff --git a/Makefile b/Makefile
> index 1323961..1ce5f5b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -83,7 +83,7 @@ else # umask / $(CURDIR) / $(O)
>  all:
>
>  # Set and export the version string
> -export BR2_VERSION := 2016.11-rc2
> +export BR2_VERSION := 2016.11-rc3
>
>  # Save running make version since it's clobbered by the make package
>  RUNNING_MAKE_VERSION := $(MAKE_VERSION)
> diff --git a/docs/website/download.html b/docs/website/download.html
> index 41b12bf..51899ff 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -42,37 +42,37 @@
>         </div>
>        </div>
>
> -      <h3 style="text-align: center;">Latest release candidate: <b>2016.11-rc2</b></h3>
> +      <h3 style="text-align: center;">Latest release candidate: <b>2016.11-rc3</b></h3>
>        <div class="row mt centered">
>         <div class="col-sm-6">
>           <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
>             <div class="flipper">
>               <div class="front">
> -               <a href="/downloads/buildroot-2016.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
> +               <a href="/downloads/buildroot-2016.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
>               </div>
>               <div class="back">
> -               <a href="/downloads/buildroot-2016.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
> +               <a href="/downloads/buildroot-2016.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
>               </div>
>             </div>
>           </div>
>
> -         <h3><a href="/downloads/buildroot-2016.11-rc2.tar.gz">buildroot-2016.11-rc2.tar.gz</a></h3>
> -         <p><a href="/downloads/buildroot-2016.11-rc2.tar.gz.sign">PGP signature</a></p>
> +         <h3><a href="/downloads/buildroot-2016.11-rc3.tar.gz">buildroot-2016.11-rc3.tar.gz</a></h3>
> +         <p><a href="/downloads/buildroot-2016.11-rc3.tar.gz.sign">PGP signature</a></p>
>         </div>
>         <div class="col-sm-6">
>           <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
>             <div class="flipper">
>               <div class="front">
> -               <a href="/downloads/buildroot-2016.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
> +               <a href="/downloads/buildroot-2016.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
>               </div>
>               <div class="back">
> -               <a href="/downloads/buildroot-2016.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
> +               <a href="/downloads/buildroot-2016.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
>               </div>
>             </div>
>           </div>
>
> -         <h3><a href="/downloads/buildroot-2016.11-rc2.tar.bz2">buildroot-2016.11-rc2.tar.bz2</a></h3>
> -         <p><a href="/downloads/buildroot-2016.11-rc2.tar.bz2.sign">PGP signature</a></p>
> +         <h3><a href="/downloads/buildroot-2016.11-rc3.tar.bz2">buildroot-2016.11-rc3.tar.bz2</a></h3>
> +         <p><a href="/downloads/buildroot-2016.11-rc3.tar.bz2.sign">PGP signature</a></p>
>         </div>
>        </div>
>
> diff --git a/docs/website/news.html b/docs/website/news.html
> index 2f4d468..11fd18a 100644
> --- a/docs/website/news.html
> +++ b/docs/website/news.html
> @@ -9,6 +9,28 @@
>  <h2>News</h2>
>  <ul class="timeline">
>
> +  <li class="timeline-inverted">
> +    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
> +    <div class="timeline-panel">
> +      <div class="timeline-heading">
> +       <h4 class="timeline-title">2016.11-rc3 released</h4>
> +       <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 November 2016</small></p>
> +      </div>
> +      <div class="timeline-body">
> +       <p>Release candidate 3 is out with more cleanups and security
> +         / build fixes. See
> +         the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.11-rc3">CHANGES</a>
> +         file for details.</p>
> +       <p>Head to the <a href="/downloads/">downloads page</a> to
> +         pick up
> +         the <a href="/downloads/buildroot-2016.11-rc3.tar.bz2">2016.11-rc3
> +           release candidate</a>, and report any problems found to
> +         the <a href="support.html">mailing list</a>
> +         or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
> +      </div>
> +    </div>
> +  </li>
> +
>    <li>
>      <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
>      <div class="timeline-panel">
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
