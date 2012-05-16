From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 May 2012 18:55:08 +0200
Subject: [Buildroot] [PATCH v2 05/11] manual: add make-tips.txt
In-Reply-To: <1336905501-9757-6-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-6-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LUuEm79mU2ZDyM1pvKLRE09KsX-fjnJz_hFDAZfCRztRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: Samuel MARTIN <s.martin49@gmail.com>
>
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ?create mode 100644 docs/manual/make-tips.txt
>
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> new file mode 100644
> index 0000000..a512689
> --- /dev/null
> +++ b/docs/manual/make-tips.txt
> @@ -0,0 +1,48 @@
> +[[make-tips]]
> +'make' tips
> +-----------
> +
> +Because Buildroot is a set of Makefiles and patches, there are few
> +things useful to know, such as:
> +
> +Display all command executed by make:
> +
> +--------------------
> + $ make V=0|1 <target>
> +--------------------
> +
> +Display all available targets:
> +
> +--------------------
> + $ make help
> +--------------------
> +
> +Note that, some settings in the +.config+ file may hide some targets
> +like:
> +

In combination with the below, this is not a fluent sentence: 'some
settings may hide some targets like ...menuconfig depends on ...'.
This problem can be solved by removing 'like'.

Additionally I'd remove the comma after 'note that'.

> +* +busybox-menuconfig+ depends whether +busybox+ is enabled or not in
> + ?the +Package selection+ menu

s/depends/depends on/

> +* +linux-menuconfig+ and +linux-savedefconfig+ depends on whether
> + ?+linux+ is enabled or not

s/depends/depend/   (plural)

> +* +uclibc-menuconfig+ depends on whether the toolchain uses the
> + ?Buildroot internal toolchain backend or not
> +* +ctng-menuconfig+ depends on whether the toolchain uses the
> + ?crosstool-NG backend or not
> +* +barebox-menuconfig+ and +barebox-savedefconfig+ depends on whether
> + ?+barebox+ bootloader is enabled or not

s/depends/depend/   (plural)

> +
> +Delete all build products (including build directories, host, staging
> +and target trees, the images and the toolchain):
> +
> +--------------------
> + $ make clean
> +--------------------
> +
> +Delete all build products as well as the configuration:
> +
> +--------------------
> + $ make distclean
> +--------------------
> +
> +Note that if +ccache+ is enabled, running +make clean|distclean+ does
> +not empty the Buildroot's cache. To delete it, refer to xref:ccache[].

"the Buildroot's cache" is not correct grammatically, but in fact it
is more the compiler cache. Buildroot doesn't have a lot to do with
it.

> diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
> index e444204..01f1041 100644
> --- a/docs/manual/working-with.txt
> +++ b/docs/manual/working-with.txt
> @@ -2,6 +2,8 @@ Working with Buildroot
> ?======================
> ?[[working-with-br]]
>
> +include::make-tips.txt[]
> +
> ?include::customize.txt[]
>
> ?include::common-usage.txt[]
> --
> 1.7.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
