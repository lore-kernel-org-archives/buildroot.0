From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 11:01:29 +0100
Subject: [Buildroot] [PATCH] openbox: new package
In-Reply-To: <1448897458-28332-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1448897458-28332-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20151222110129.467c78a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel,

On Mon, 30 Nov 2015 12:30:58 -0300, Ezequiel Garcia wrote:
> Add support for the Openbox Windows Manager.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> Openbox was submitted long ago to Buildroot but it never got accepted:

I've applied your patch, but after doing a few substantial changes:

    [Thomas:
      - don't mention MMU in the Config.in comment.
      - wchar was forgotten in the Config.in comment.
      - the dependency of the comment on thread should be "depends on
        !BR2_TOOLCHAIN_HAS_THREADS" so that the comment is shown when
        thread support is *not* available.
      - add missing select of BR2_PACKAGE_XLIB_LIBXFT and
        BR2_PACKAGE_XLIB_LIBXRENDER which are needed for pango to have xft
        support, otherwise the build fails with "configure: error: Package
        requirements (pango >= 1.8.0 pangoxft >= 1.8.0) were not met:"
      - remove useless empty newline in the hash file
      - add missing dependency on host-pkgconf, which is needed since
        the configure.ac uses PKG_CHECK_MODULES.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
