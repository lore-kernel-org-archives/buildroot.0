From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jun 2019 00:46:12 +0200
Subject: [Buildroot] [PATCH v7 1/1] package/libglib2: bump to version
 2.60.3
In-Reply-To: <20190528194811.120927-1-aduskett@gmail.com>
References: <20190528194811.120927-1-aduskett@gmail.com>
Message-ID: <51a50929-cc47-7be9-d5e3-5d22781f7535@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 28/05/2019 21:48, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Changes include:
>   - Change the package type to meson, as autoconf is no longer supported.
> 
>   - Add 0002-add-option-to-build-tests.patch
>       Upstream won't build tests when cross-compiling. However; this means still
>       building the tests during a host build. Building the tests causes build
>       failures on older distributions such as CentOS 6 and Debian 7 because of
>       the command `objcopy --add-symbol` is used when building the test
>       "test_resources2," which is not available with the older version of
>       objcopy provided by the distributions.
> 
>   - Add 0003-remove-cpp-requirement.patch:
>      C++ is not needed when just compiling. The inclusion of C++ in meson.build
>      is to ensure libglib doesn't accidentally use C++ reserved keywords in
>      public headers. Because tests aren't being compiled, there is no need for
>      C++ as a requirement.
>      (https://gitlab.gnome.org/GNOME/glib/issues/1748)
> 
>   - Add 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch:
>     This prevents a false error when compiling against older gcc versions.
>     (https://gitlab.gnome.org/GNOME/glib/issues/1744)
> 
>   - Remove 0004-Do-not-hardcode-python-path-into-various-tools.patch:
>       The switch to meson makes this obsolete.
> 
>   - Remove LIBGLIB2_AUTORECONF = YES from libglib2.mk:
>       Now that libglib2 is a meson package, there is no need for AUTORECONF.
> 
>   - Remove LIBGLIB2_INSTALL_STAGING_OPTS from libglib2.mk:
>       Meson resolves these correctly.
> 
>   - Add LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE in libglib2.mk:
>       Newer versions of libglib2 prefix glib-genmarshal, gobject-query, and
>       glib-mkenums with ${bindir}. Unfortunately, this will resolve to the host
>       systems /bin/ directory, which will cause compilation issues if the host
>       does not have these programs. By removing the ${bindir}/ prefix, these
>       programs are resolved in PATH instead.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 Applied to master, thanks.

 Thanks for keeping this going for four months!

 Regards,
 Arnout
