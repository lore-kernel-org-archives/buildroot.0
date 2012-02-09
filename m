From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 9 Feb 2012 08:38:04 +0100
Subject: [Buildroot] [PATCH 1/1] docs: Add customizing toolchain section
In-Reply-To: <1328739654-7585-1-git-send-email-s.martin49@gmail.com>
References: <1328739654-7585-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LVOn1P0Pzv3nvLVDySw=M3if4_i7LmoqxhU28iS++MXoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 8 feb. 2012 23:21 schreef "Samuel MARTIN" <s.martin49@gmail.com> het
volgende:
>
>
> Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
> ---
>  docs/manual/customize-toolchain.txt |   45
+++++++++++++++++++++++++++++++++++
>  docs/manual/customize.txt           |    2 +
>  docs/manual/external-toolchain.txt  |    1 +
>  3 files changed, 48 insertions(+), 0 deletions(-)
>  create mode 100644 docs/manual/customize-toolchain.txt
>
> diff --git a/docs/manual/customize-toolchain.txt
b/docs/manual/customize-toolchain.txt
> new file mode 100644
> index 0000000..a54e2e2
> --- /dev/null
> +++ b/docs/manual/customize-toolchain.txt
> @@ -0,0 +1,45 @@
> +Customizing the toolchain
> +-------------------------
> +[[toolchain-custom]]
> +
> +There are three distinct types of toolchain backend supported in
Buildroot,
> +available under the menu +Toolchain+, invoking +make menuconfig+.
> +
> +Using the external toolchain backend
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +There is no way of tuning an external toolchain since Buildroot does not
> +generate it.
> +
> +It also requires to set the Buildroot settings according to the
toolchain ones
> +(see xref:external-toolchain[]).
> +
> +Using the internal Buildroot toolchain backend
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The internal Buildroot toolchain backend *only* allows to generate
> +*http://www.uclibc.org/[uClibc]-based toolchains*.
> +
> +However, it allows to tune major settings, such as:
> +
> +* Linux header version
> +
> +* http://www.uclibc.org/[uClibc] configuration (see
xref:uclibc-custom[uClibc])
> +
> +* Binutils, GCC, Gdb and toolchain options
> +
> +This is directly avaiblable after selecting the +Buildroot toolchain+
type in

available

> +the menu +Toolchain+.
> +
> +Using the Crosstool-NG backend
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a
rather
> +limited set of settings under the Buildroot +Toolchain+ menu (ie. when
invoking
> ++make menuconfig+); mostly:
> +
> +* The http://crosstool-ng.org[crosstool-NG] configuration file
> +
> +* Gdb and some toolchain options
> +
> +Then, the toolchain can be finely tuned invoking +make ctng-menuconfig+.
> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> index c9f4dfd..e8235de 100644
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -8,3 +8,5 @@ include::customize-busybox-config.txt[]
>  include::customize-uclibc-config.txt[]
>
>  include::customize-kernel-config.txt[]
> +
> +include::customize-toolchain.txt[]
> diff --git a/docs/manual/external-toolchain.txt
b/docs/manual/external-toolchain.txt
> index 20eebdb..62eb0a3 100644
> --- a/docs/manual/external-toolchain.txt
> +++ b/docs/manual/external-toolchain.txt
> @@ -1,5 +1,6 @@
>  Using an external toolchain
>  ===========================
> +[[external-toolchain]]
>
>  Using an already existing toolchain is useful for different
>  reasons:

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120209/6503264f/attachment.html>
