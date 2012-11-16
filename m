From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Nov 2012 13:55:19 +0100
Subject: [Buildroot] [PATCH] manual: minor tweaks
In-Reply-To: <1353067194-32240-1-git-send-email-spdawson@gmail.com>
References: <1353067194-32240-1-git-send-email-spdawson@gmail.com>
Message-ID: <201211161355.19631.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, All,

Please find my comments below.

On Friday 16 November 2012 12:59:54 spdawson at gmail.com wrote:
> Minor grammatical and spelling tweaks to the manual content.
[--SNIP--]
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index acc73d3..38dfa2b 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -7,7 +7,7 @@ Tips and tricks
>  Package name, config entry name and makefile variable relationship
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> -In Buildroot, there are some relation between:
> +In Buildroot, there are some relationships between:

Use singular:
  There is some relationship ...

>  * the _package name_, which is the package directory name (and the
>    name of the +*.mk+ file);
> @@ -16,8 +16,8 @@ In Buildroot, there are some relation between:
>  
>  * the makefile variable prefix.
>  
> -Thus, it is mandatory to keep consistency between all this stuff,
> -matching the following rules:
> +It is mandatory to be maintain consistency between these elements,
> +using the following rules:

... to maintain ...

> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index b2e6e7d..b94b670 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -57,7 +57,7 @@ Lastly, send/submit your patch set to the Buildroot mailing list:
>  Note that +git+ should be configured to use your mail account.
>  To configure +git+, see +man git-send-email+ or google it.
>  
> -Make sure posted *patches are not line-wrapped*, otherwise it cannot
> +Make sure posted *patches are not line-wrapped*, otherwise they cannot
>  easily be applied. In such a case, fix your e-mail client, or better,
>  use +git send-email+ to send your patches.
>  
> @@ -79,11 +79,11 @@ Tested-by:: Indicates that the patch has been tested. It is useful
>  Autobuild
>  ---------
>  
> -The Buildroot community is currently setting up automatic build i
> -order to test more and more configuration. All build results are
> +The Buildroot community is currently setting up automatic builds in
> +order to test more and more configurations. All build results are
>  available at http://autobuild.buildroot.org[]
>  
> -A way to contribute is fixing broken builds.
> +A good way to contribute is by fixing broken builds.
>  
>  In the commit message of a patch fixing an _autobuild_, add a
>  reference to the _build result directory_ (the +dir+ link in the _data
> @@ -97,17 +97,17 @@ Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2
>  Reporting issues/bugs, get help
>  -------------------------------
>  
> -Before reporting some issues, please chek
> -xref:mailing-list-subscribe[the mailing list archive] in case someone had
> +Before reporting some issues, please check

Before reporting any issue, ...

> +xref:mailing-list-subscribe[the mailing list archive] in case someone has
>  already reported and fixed a similar problem.
>  
> -Whatever the way you choose to report some bugs or get help,
> +However you choose to report bugs or get help,
>  xref:bugtracker[opening a bug] or
> -xref:mailing-list-subscribe[send a mail to the mailing list], there is
> -a number of detail to provide in order to help people reproduce and
> +xref:mailing-list-subscribe[send a mail to the mailing list], there are
> +a number of details to provide in order to help people reproduce and
>  find a solution to the issue.
>  
> -Try to think as you would be the one who will help someone else; in
> +Try to think as you would if you were helping someone else; in

Try to think as if you were trying to help ...

> diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
> index 8c66a76..dac5669 100644
> --- a/docs/manual/download-location.txt
> +++ b/docs/manual/download-location.txt
> @@ -5,7 +5,7 @@ Location of downloaded packages
>  
>  It might be useful to know that the various tarballs that are
>  downloaded by the Makefiles are all stored in the +DL_DIR+ which by

... in DL_DIR ...

> diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
> index 27dda37..bf65554 100644
> --- a/docs/manual/embedded-basics.txt
> +++ b/docs/manual/embedded-basics.txt
> @@ -4,7 +4,7 @@ Embedded system basics
>  ----------------------
>  
>  When developing an embedded system, there are a number of choices to
> -do:
> +make:

No, 'make' has an underlying meaning of 'building something physical'.
'do' on the otherhand is generic. However, I'd turn it thus:

... a number of choices to address:

> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 6911c55..3ecc3ae 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -7,7 +7,7 @@ Frequently Asked Questions & Troubleshooting
>  The boot hangs after 'Starting network...'
>  ------------------------------------------
>  
> -If the boot process seems to hand after the following messages
> +If the boot process seems to hang after the following messages
>  (messages not necessarily exactly similar, depending on the list of
>  packages selected):
>  
> @@ -20,7 +20,7 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
>  
>  then it means that your system is running, but didn't start a shell on
>  the serial console. In order to have the system start a shell on your
> -serial console, you have to go in the Buildroot configuration, +System
> +serial console, you have to go into the Buildroot configuration, +System
>  configuration+, and modify +Port to run a getty (login prompt) on+ and
>  +Baudrate to use+ as appropriate. This will automatically tune the
>  +/etc/inittab+ file of the generated system so that a shell starts on
> @@ -42,21 +42,21 @@ you should install the +glibc-static+ package. This is because the
>  C library.
>  
>  [[faq-no-compiler-on-target]]
> -Why there is no compiler on the target?
> +Why is there no compiler on the target?
>  ---------------------------------------
>  
> -It has been decided that the support of the _native compiler for the
> -target_ would be stopped since the Buildroot-2012.11 release because:
> +It has been decided that support for the _native compiler on the
> +target_ would be stopped from the Buildroot-2012.11 release because:
>  
> -* this feature was not maintained nor tested and often broken;
> +* this feature was not maintained or tested, and often broken;

... neither maintained not tested ...

> @@ -123,12 +123,12 @@ more explanations).
>  Why not use the target directory as a chroot directory?
>  -------------------------------------------------------
>  
> -There are plenty of reason to *not* use the target directory a chroot
> +There are plenty of reasons to *not* use the target directory a chroot
>  one, among these:
>  
> -* files' owners, modes and permissions are not correctly set in the
> +* file ownerships, modes and permissions are not correctly set in the
>    target directory;
> -* devices nodes are not created in the target directory.
> +* device nodes are not created in the target directory.
>  
> -Because of that, commands run in through chroot, using the target
> -directory as new root, will fail.
> +For these reasons, commands run through chroot, using the target
> +directory as the new root, will fail.

... would fail.

> diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
> index 879cff3..31774c0 100644
> --- a/docs/manual/how-buildroot-works.txt
> +++ b/docs/manual/how-buildroot-works.txt
> @@ -9,7 +9,7 @@ also includes patches for various software packages - mainly the ones
>  involved in the cross-compilation tool chain (+gcc+, +binutils+ and
>  +uClibc+).
>  
> -There is basically one Makefile per software package, and they are
> +There is basically one Makefile for each software package, and they are

Why? 'per' is perfectly legit in this context.

> diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
> index 91ecb04..3f4cca8 100644
> --- a/docs/manual/introduction.txt
> +++ b/docs/manual/introduction.txt
[--SNIP--]
> @@ -15,7 +15,7 @@ processors everyone is used to having in his PC. They can be PowerPC
>  processors, MIPS processors, ARM processors, etc.
>  
>  Buildroot supports numerous processors and their variants; it also
> -comes with default configuration for several boards available
> -off-the-shelf. Besides, a number of third-party projects are based on
> +comes with default configurations for several boards available
> +off-the-shelf. Besides this, a number of third-party projects are based on

... are based on, ...   (missing a comma after 'on')

> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 22e5769..c98da6c 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -12,17 +12,18 @@ All of the end products of Buildroot (toolchain, root filesystem, kernel,
>  bootloaders) contain opensource software, released under various licenses.
>  
>  Using opensource software gives you the freedom to build rich embedded
> -systems choosing from a wide range of packages, but also gives some
> +systems choosing from a wide range of packages, but also imposes some

... embedded systems, ... (missing comma)

>  obligations that you must know and honour.
>  Some licenses require you to publish the license text in the documentation of
> -your product. Other require you to redistribute the source code of the
> +your product. Others require you to redistribute the source code of the
>  software to those that receive your product.
>  
>  The exact requirements of each license is documented in each package, and it is
> -your (or your legal office's) responsibility to comply with these requirements.
> +your responsibility (or that of your legal office) to comply with these
> +requirements.

... those requirements.

Difference between 'these' (singular: 'this') and 'those' (singular: 'that'):
  - 'these' (this) is for something that has some proximity to you.
  - 'those' (that) refers to something that is distant from you.

For example:
  - these keys are always in my pocket: the keys you're speaking about are
    quite near to you;
  - those guys in the other town: the guys are quite far from you, being in
    another town;
  - this letter arrived today: the letter you have in your hand, or on your
    desk;
  - that guy over there, by the porch: the guy that is standing by the porch
    on the other end of the street.

In this case, the requirements are those of the packages. Packages are
not part of buildroot, so there is a notion of distance, which should be
conveyed by using 'those'.

> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index 551ea12..a54df35 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -10,16 +10,16 @@ necessary to patch the source of the software to get it built within
>  Buildroot.
>  
>  Buildroot offers an infrastructure to automatically handle this during
> -the builds. It support several ways of applying patch sets:
> +the builds. It supports several ways of applying patch sets:
>  
> -Provinding patches
> +Providing patches
>  ~~~~~~~~~~~~~~~~~~

Nit-pick: shorten the ~~~ line, too.

> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index a723d11..d3c087a 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -10,7 +10,7 @@ A full rebuild is achieved by running:
>  $ make clean all
>  ---------------
>  
> -In what cases, a full rebuild is mandatory:
> +In certain cases, a full rebuild is mandatory:

In some cases, ...

> @@ -22,14 +22,14 @@ In what cases, a full rebuild is mandatory:
>  
>  * after removing some libraries from the package selection.
>  
> -In what cases, a full rebuild is recommended:
> +In certain cases, a full rebuild is recommended:

Ditto.

> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
> index e0a5a2a..c32f855 100644
> --- a/docs/manual/writing-rules.txt
> +++ b/docs/manual/writing-rules.txt
> @@ -3,7 +3,7 @@
>  Writing rules
>  -------------
>  
> -Overall, those writing rules are here to help you add new files in
> +Overall, these writing rules are here to help you add new files in

Proper use of 'these' in this case! ;-)

When you have addressed these changes, you can add my:
  - Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN;

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
