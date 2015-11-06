From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2015 13:37:21 +0100
Subject: [Buildroot] [PATCH v2] pkgconf: fix incorrect
 variable-directory sysroot prefixing
In-Reply-To: <1446501424-26609-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446501424-26609-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151106133721.3ca401a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  2 Nov 2015 18:57:04 -0300, Gustavo Zacarias wrote:
> According to the pkg-config documents ("specification") when
> sysroot-prefixing is enabled via PKG_CONFIG_SYSROOT_DIR this should only
> be applied to -I/-L directories (includes, library directories), and not
> to all of the other variables that can specify a directory.
> 
> However xorg uses mapdir/sdkdir in a similar fashion in what could be
> considered an abuse of the spec, hence needs to be prefixed as well.
> And what's more, it also uses includedir in a nonstandard fashion just
> requesting the value via 'pkg-config --variable=includedir libfoo' which
> doesn't pass the standard prefixing rules for the --cflags and --libs
> invocation.
> 
> This patch makes pkgconf behave in the pkg-config specified way with the
> added exception for the includedir, libdir, mapdir and sdkdir variables
> which are prefixed.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-Fix-all-variables-sysroot-prefix-problem.patch | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
