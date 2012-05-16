From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 May 2012 13:45:17 +0200
Subject: [Buildroot] [PATCH v2 01/11] manual: rework the whole
 documentation stub
In-Reply-To: <1336905501-9757-2-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-2-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LUE3F8ycrzjjxBYVhQWjcGYSpUoudcZzcYsC70t0PKV_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: Samuel MARTIN <s.martin49@gmail.com>
>
> The new skeleton of the manual as it has been thought:
> 1. ?About Buildroot:
> ? ? Presentation of Buildroot
> 2. ?Starting up:
> ? ? Everything to quickly and easily start working with Buildroot
> 3. ?Working with Buildroot
> ? ? Basics to make your work fitting your needs
> 4. ?Troubleshooting
> 5. ?Going further in Buildroot's innards
> ? ? Explaination of how buildroot is organised, how it works, etc
> 6. ?Developer Guidelines
> 7. ?Getting involved
> 8. ?Contibuting to Buildroot
> 9. ?Legal notice
> 10. Appendix
>
> It is easy to distinguish two parts in this plan:
> - Sections 1 to 4 mainly address people starting with Buildroot
> - Sections 5 to 10 are more focused on how to develop Buildroot itself
>
> Most of the existing sections have just been moved in the hierarchy,
> few were split and dispatch in, what i think was the relevant section,
> and numerous others have been created.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ?create mode 100644 docs/manual/advanced.txt
> ?create mode 100644 docs/manual/common-usage.txt
> ?create mode 100644 docs/manual/developer-guide.txt
> ?create mode 100644 docs/manual/going-further.txt
> ?create mode 100644 docs/manual/legal-notice.txt
> ?create mode 100644 docs/manual/starting-up.txt
> ?create mode 100644 docs/manual/working-with.txt
>
> diff --git a/docs/manual/adding-packages-autotargets.txt b/docs/manual/adding-packages-autotargets.txt
> index 428a182..dcc7a24 100644
> --- a/docs/manual/adding-packages-autotargets.txt
> +++ b/docs/manual/adding-packages-autotargets.txt
> @@ -1,10 +1,10 @@
> ?Infrastructure for autotools-based packages
> --------------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?[[autotargets-tutorial]]
>
> ?+AUTOTARGETS+ tutorial
> -~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^
>
> ?First, let's see how to write a +.mk+ file for an autotools-based
> ?package, with an example :
> @@ -64,7 +64,7 @@ package to be built.
> ?[[autotargets-reference]]
>
> ?+AUTOTARGETS+ reference
> -~~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^^
>
> ?The main macro of the autotools package infrastructure is
> ?+AUTOTARGETS+. It has the same number of arguments and the
> diff --git a/docs/manual/adding-packages-cmaketargets.txt b/docs/manual/adding-packages-cmaketargets.txt
> index 3e400ec..a6b2273 100644
> --- a/docs/manual/adding-packages-cmaketargets.txt
> +++ b/docs/manual/adding-packages-cmaketargets.txt
> @@ -1,10 +1,10 @@
> ?Infrastructure for CMake-based packages
> ----------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?[[cmaketargets-tutorial]]
>
> ?+CMAKETARGETS+ tutorial
> -~~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^^
>
> ?First, let's see how to write a +.mk+ file for a CMake-based package,
> ?with an example :
> @@ -63,7 +63,7 @@ package to be built.
> ?[[cmaketargets-reference]]
>
> ?+CMAKETARGETS+ reference
> -~~~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^^^
>
> ?The main macro of the CMake package infrastructure is
> ?+CMAKETARGETS+. It has the same number of arguments and the same
> diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
> index 3475827..d03dc4e 100644
> --- a/docs/manual/adding-packages-conclusion.txt
> +++ b/docs/manual/adding-packages-conclusion.txt
> @@ -1,5 +1,5 @@
> ?Conclusion
> -----------
> +~~~~~~~~~~
>
> ?As you can see, adding a software package to Buildroot is simply a
> ?matter of writing a Makefile using an ?existing example and modifying it
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 2670f2f..1428f37 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -1,5 +1,5 @@
> ?Package directory
> ------------------
> +~~~~~~~~~~~~~~~~~
>
> ?First of all, create a directory under the +package+ directory for
> ?your software, for example +libfoo+.
> @@ -10,7 +10,7 @@ one of these categories, then create your package directory in these.
>
>
> ?+Config.in+ file
> -~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^
>
> ?Then, create a file named +Config.in+. This file will contain the
> ?option descriptions related to our +libfoo+ software that will be used
> @@ -146,7 +146,7 @@ so, the dependency also needs to be expressed in the +.mk+ file of the
> ?package.
>
> ?The +.mk+ file
> -~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^
>
> ?Finally, here's the hardest part. Create a file named +libfoo.mk+. It
> ?describes how the package should be downloaded, configured, built,
> diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
> index cfcee8c..c0ad89d 100644
> --- a/docs/manual/adding-packages-gentargets.txt
> +++ b/docs/manual/adding-packages-gentargets.txt
> @@ -1,5 +1,5 @@
> ?Infrastructure for packages with specific build systems
> --------------------------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?By 'packages with specific build systems' we mean all the packages
> ?whose build system is not one of the standard ones, such as
> @@ -9,7 +9,7 @@ system is based on hand-written Makefiles or shell scripts.
> ?[[gentargets-tutorial]]
>
> ?+GENTARGETS+ Tutorial
> -~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^
>
> ?------------------------------
> ?01: #############################################################
> @@ -90,7 +90,7 @@ Makefile code necessary to make your package working.
> ?[[gentargets-reference]]
>
> ?+GENTARGETS+ Reference
> -~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^
>
> ?The +GENTARGETS+ macro takes one optional argument. This argument can
> ?be used to tell if the package is a target package (cross-compiled for
> diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
> index 1ed834e..7eced86 100644
> --- a/docs/manual/adding-packages-gettext.txt
> +++ b/docs/manual/adding-packages-gettext.txt
> @@ -1,5 +1,5 @@
> ?Gettext integration and interaction with packages
> --------------------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?Many packages that support internationalization use the gettext
> ?library. Dependencies for this library are fairly complicated and
> diff --git a/docs/manual/adding-packages-handwritten.txt b/docs/manual/adding-packages-handwritten.txt
> index beb25f6..25fa93c 100644
> --- a/docs/manual/adding-packages-handwritten.txt
> +++ b/docs/manual/adding-packages-handwritten.txt
> @@ -1,7 +1,5 @@
> -[[handwritten-tutorial]]
> -

Why is this removed? I still see a reference to it in
adding-packages-directory.txt.

> ?Manual Makefile
> ----------------
> +~~~~~~~~~~~~~~~
>
> ?*NOTE: new manual makefiles should not be created, and existing manual
> ?makefiles should be converted either to the generic, autotools or
> diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
> index 0217e9f..91649d4 100644
> --- a/docs/manual/adding-packages.txt
> +++ b/docs/manual/adding-packages.txt
> @@ -1,5 +1,6 @@
> +[[adding-packages]]
> ?Adding new packages to Buildroot
> -================================
> +--------------------------------
>
> ?This section covers how new packages (userspace libraries or
> ?applications) can be integrated into Buildroot. It also shows how
> diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
> new file mode 100644
> index 0000000..f433c13
> --- /dev/null
> +++ b/docs/manual/advanced.txt
> @@ -0,0 +1,10 @@
> +Advanced usage
> +--------------
> +
> +include::using-buildroot-toolchain.txt[]
> +
> +include::external-toolchain.txt[]
> +
> +include::ccache-support.txt[]
> +
> +include::download-location.txt[]
> diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
> index d1d9d63..e8142ab 100644
> --- a/docs/manual/board-support.txt
> +++ b/docs/manual/board-support.txt
> @@ -1,5 +1,6 @@
> +[[board-support]]
> ?Creating your own board support
> -===============================
> +-------------------------------
>
> ?Creating your own board support in Buildroot allows users of a
> ?particular hardware platform to easily build a system that is known to
> diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
> index ab8cbad..37a9f92 100644
> --- a/docs/manual/ccache-support.txt
> +++ b/docs/manual/ccache-support.txt
> @@ -1,5 +1,6 @@
> +[[ccache]]
> ?Using +ccache+ in Buildroot
> -===========================
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?http://ccache.samba.org[ccache] is a compiler cache. It stores the
> ?object files resulting from each compilation process, and is able to
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> new file mode 100644
> index 0000000..ff8543f
> --- /dev/null
> +++ b/docs/manual/common-usage.txt
> @@ -0,0 +1,4 @@
> +Daily use
> +---------
> +
> +include::rebuilding-packages.txt[]
> diff --git a/docs/manual/customize-busybox-config.txt b/docs/manual/customize-busybox-config.txt
> index 60e6a55..880fe3a 100644
> --- a/docs/manual/customize-busybox-config.txt
> +++ b/docs/manual/customize-busybox-config.txt
> @@ -1,6 +1,6 @@
> -Customizing the Busybox configuration
> --------------------------------------
> ?[[busybox-custom]]
> +Customizing the Busybox configuration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?http://www.busybox.net/[Busybox] is very configurable, and you may
> ?want to customize it. You can follow these simple steps to do so. This
> @@ -20,5 +20,5 @@ Otherwise, you can simply change the
> ?options you want to change, without using the configuration tool.
>
> ?If you want to use an existing config file for busybox, then see
> -section xref:env-vars[].
> +xref:env-vars[].
>
> diff --git a/docs/manual/customize-kernel-config.txt b/docs/manual/customize-kernel-config.txt
> index 6bafe46..93470be 100644
> --- a/docs/manual/customize-kernel-config.txt
> +++ b/docs/manual/customize-kernel-config.txt
> @@ -1,5 +1,6 @@
> +[[kernel-custom]]
> ?Customizing the Linux kernel configuration
> -------------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?The Linux kernel configuration can be customized just like
> ?xref:busybox-custom[BusyBox] and xref:uclibc-custom[uClibc] using
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index 8c3ea82..123c97f 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -1,5 +1,6 @@
> +[[rootfs-custom]]
> ?Customizing the generated target filesystem
> --------------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?There are a few ways to customize the resulting target filesystem:
>
> diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
> index 08b60a2..b4ac4a4 100644
> --- a/docs/manual/customize-toolchain.txt
> +++ b/docs/manual/customize-toolchain.txt
> @@ -1,12 +1,12 @@
> -Customizing the toolchain
> --------------------------
> ?[[toolchain-custom]]
> +Customizing the toolchain
> +~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?There are three distinct types of toolchain backend supported in Buildroot,
> ?available under the menu +Toolchain+, invoking +make menuconfig+.
>
> ?Using the external toolchain backend
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> ?There is no way of tuning an external toolchain since Buildroot does not
> ?generate it.
> @@ -15,7 +15,7 @@ It also requires to set the Buildroot settings according to the toolchain ones
> ?(see xref:external-toolchain[]).
>
> ?Using the internal Buildroot toolchain backend
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> ?The internal Buildroot toolchain backend *only* allows to generate
> ?*http://www.uclibc.org/[uClibc]-based toolchains*.
> @@ -32,7 +32,7 @@ This is directly available after selecting the +Buildroot toolchain+ type in
> ?the menu +Toolchain+.
>
> ?Using the Crosstool-NG backend
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> ?The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
> ?limited set of settings under the Buildroot +Toolchain+ menu (ie. when invoking
> diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
> index e2e6799..6db4e41 100644
> --- a/docs/manual/customize-uclibc-config.txt
> +++ b/docs/manual/customize-uclibc-config.txt
> @@ -1,6 +1,6 @@
> -Customizing the uClibc configuration
> -------------------------------------
> ?[[uclibc-custom]]
> +Customizing the uClibc configuration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?Just like xref:busybox-custom[BusyBox], http://www.uclibc.org/[uClibc]
> ?offers a lot of configuration options. They allow you to select
> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> index e8235de..8778fdd 100644
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -1,5 +1,5 @@
> ?Customization
> -=============
> +-------------
>
> ?include::customize-rootfs.txt[]
>
> diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
> new file mode 100644
> index 0000000..69f3632
> --- /dev/null
> +++ b/docs/manual/developer-guide.txt
> @@ -0,0 +1,6 @@
> +Developer Guidelines
> +====================
> +
> +include::adding-packages.txt[]
> +
> +include::board-support.txt[]
> diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
> index cb6147f..7ac98c0 100644
> --- a/docs/manual/download-location.txt
> +++ b/docs/manual/download-location.txt
> @@ -1,5 +1,5 @@
> ?Location of downloaded packages
> -===============================
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?It might be useful to know that the various tarballs that are
> ?downloaded by the Makefiles are all stored in the +DL_DIR+ which by
> diff --git a/docs/manual/external-toolchain.txt b/docs/manual/external-toolchain.txt
> index 62eb0a3..30efe42 100644
> --- a/docs/manual/external-toolchain.txt
> +++ b/docs/manual/external-toolchain.txt
> @@ -1,6 +1,6 @@
> -Using an external toolchain
> -===========================
> ?[[external-toolchain]]
> +Using an external toolchain
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?Using an already existing toolchain is useful for different
> ?reasons:
> diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
> index 42ca009..6cfdefb 100644
> --- a/docs/manual/getting.txt
> +++ b/docs/manual/getting.txt
> @@ -1,5 +1,6 @@
> +[[getting-buildroot]]
> ?Getting Buildroot
> -=================
> +-----------------
>
> ?Buildroot releases are made approximately every 3 months. Direct Git
> ?access and daily snapshots are also available, if you want more
> diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
> new file mode 100644
> index 0000000..6f3cd6e
> --- /dev/null
> +++ b/docs/manual/going-further.txt
> @@ -0,0 +1,6 @@
> +Going further in Buildroot's innards
> +====================================
> +
> +include::how-buildroot-works.txt[]
> +
> +include::advanced.txt[]
> diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
> index 481e5a4..1e86ca3 100644
> --- a/docs/manual/how-buildroot-works.txt
> +++ b/docs/manual/how-buildroot-works.txt
> @@ -1,5 +1,5 @@
> ?How Buildroot works
> -===================
> +-------------------
>
> ?As mentioned above, Buildroot is basically a set of Makefiles that
> ?download, configure, and compile software with the correct options. It
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> new file mode 100644
> index 0000000..3d741a9
> --- /dev/null
> +++ b/docs/manual/legal-notice.txt
> @@ -0,0 +1,4 @@
> +Legal notice
> +============
> +
> +TODO
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index 732b50c..b35b5f6 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -11,24 +11,20 @@ image::logo.png[]
>
> ?include::introduction.txt[]
>
> -include::getting.txt[]
> +include::starting-up.txt[]
>
> -include::using.txt[]
>
> -include::customize.txt[]
>
> -include::rebuilding-packages.txt[]
> +include::working-with.txt[]
>
> -include::how-buildroot-works.txt[]
>
> -include::using-buildroot-toolchain.txt[]
>
> -include::external-toolchain.txt[]
>
> -include::ccache-support.txt[]
> +include::going-further.txt[]
>
> -include::download-location.txt[]
> +include::developer-guide.txt[]
> +
> +include::legal-notice.txt[]
>
> -include::adding-packages.txt[]
>
> ?include::appendix.txt[]
> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index f247dd0..717121a 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -1,5 +1,5 @@
> ?Understanding how to rebuild packages
> -=====================================
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?One of the most common questions asked by Buildroot users is how to
> ?rebuild a given package or how to remove a package without rebuilding
> diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
> new file mode 100644
> index 0000000..4f567f0
> --- /dev/null
> +++ b/docs/manual/starting-up.txt
> @@ -0,0 +1,7 @@
> +Starting up
> +===========
> +
> +include::getting.txt[]
> +
> +include::using.txt[]
> +
> diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
> index 712e9a8..24e797f 100644
> --- a/docs/manual/using-buildroot-toolchain.txt
> +++ b/docs/manual/using-buildroot-toolchain.txt
> @@ -1,5 +1,5 @@
> ?Using the generated toolchain outside Buildroot
> -===============================================
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ?You may want to compile, for your target, your own programs or other
> ?software that are not packaged in Buildroot. In order to do this you
> diff --git a/docs/manual/using.txt b/docs/manual/using.txt
> index a5dc9e1..88dc58c 100644
> --- a/docs/manual/using.txt
> +++ b/docs/manual/using.txt
> @@ -1,8 +1,5 @@
> ?Using Buildroot
> -===============
> -
> -Configuration and general usage
> --------------------------------
> +---------------
>
> ?Buildroot has a nice configuration tool similar to the one you can
> ?find in the http://www.kernel.org/[Linux kernel] or in
> diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
> new file mode 100644
> index 0000000..e444204
> --- /dev/null
> +++ b/docs/manual/working-with.txt
> @@ -0,0 +1,10 @@
> +Working with Buildroot
> +======================
> +[[working-with-br]]
> +
> +include::customize.txt[]
> +
> +include::common-usage.txt[]
> +
> +Tweaking Buildroot
> +------------------
> --
> 1.7.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
