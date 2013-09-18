From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 00:06:24 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <89b40887c8268e316399.1379494896@argentina>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
Message-ID: <523A23E0.4040602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/13 11:01, Thomas De Schampheleire wrote:
> Currently, the comments in Config.in files when depending on toolchain options
> are not at all lined up. This patch adds a section to the documentation that
> explains which format is to be used.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> Notes:
> - How we will specify the C library is currently marked as 'to be decided'.
> This patch series does not yet unify that, but I plan to do that in a new
> patch (or update this series if we can reach a decision shortly).  The problem
> is that not all packages that have a dependency on e.g. glibc add a comment to
> show this to the user. A proposal would be to have a comment like:
>      foo needs a (e)glibc toolchain w/ featA, featB, featC
> where the '(e)glibc' string would be left out if there is no constraint on the
> C library.
>
> - For the 'dynamic library' option: there are packages that depend on it but do
> not have a comment indicating that. If there is an agreement on the format as
> shown in this patch, then I will do that.

  I agree on all points.

  For the 'dynamic library' option, I don't think it's that important to 
add a comment for it. It's so exotic, and you probably select only very 
few packages in that case anyway, so the likelihood of someone 
encountering that situation is pretty slim.


[snip]
> +[[dependencies-toolchain-options]]
> +Dependencies on toolchain options
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +Many packages depend on certain options of the toolchain, like the
> +C library, C++ support, largefile support, thread support, RPC
> +support, IPv6 support, wchar support, or dynamic libraries. These
> +dependencies have to expressed with the appropriate 'depends on'
> +statements in the Config.in file. Additionally, a +comment+ should be
> +displayed when the option is not enabled, so that the user knows why
> +the package is not available.
> +
> +The general format of such a +comment+ for package foo is:
> +--------------------------
> +foo needs a toolchain w/ featA, featB, featC
> +--------------------------
> +
> +for example:
> +--------------------------
> +aircrack-ng needs a toolchain w/ largefile, threads
> +--------------------------
> +
> +Note that this text is kept brief on purpose, so that it will fit on a
> +80-character terminal without scrolling.

  There is no scrolling in menuconfig, so just put "so that it will fit 
on a 80-character terminal".

  Regards,
  Arnout

> +
> +The rest of this section enumerates the different toolchain options,
> +the corresponding config symbols to depend on, and the string literals
> +to use in the comment.
> +
> +* C library
> +** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
> ++BR2_TOOLCHAIN_USES_UCLIBC+
> +** Comment string: (to be decided)
> +
> +* C++ support
> +** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
> +** Comment string: `C++`
> +
> +* largefile support
> +** Dependency symbol: +BR2_LARGEFILE+
> +** Comment string: +largefile+
> +
> +* thread support
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
> +** Comment string: +threads+
> +
> +* RPC support
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
> +** Comment string: +RPC+
> +
> +* IPv6 support
> +** Dependency symbol: +BR2_INET_IPV6+
> +** Comment string: +IPv6+ (lowercase v)
> +
> +* wchar support
> +** Dependency symbol: +BR2_USE_WCHAR+
> +** Comment string: +wchar+
> +
> +* dynamic library: the user can indicate that he wants static
> +libraries where possible, but not all packages support that.
> +** Dependency symbol: +BR2_PREFER_STATIC_LIB+
> +** Comment string: +dynamic library+
> +
> +
>   The +.mk+ file
>   ~~~~~~~~~~~~~~
>   [[adding-packages-mk]]
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
