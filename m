From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:07:52 +0100
Subject: [Buildroot] [PATCH v2] pulseview: new package
In-Reply-To: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
References: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150320230752.46792018@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Thu, 19 Mar 2015 11:08:28 +0100, Bartosz Golaszewski wrote:
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> Version 2:
> - select BR2_PACKAGE_QT5BASE_PNG in Config.in - this is needed for
>   pulseview to properly display .png icons
> - don't select libserial port

Thanks, applied, after fixing a small number of remaining issues:

    [Thomas:
      - Fix dependency on C++, it should use BR2_INSTALL_LIBSTDCPP and not
        BR2_TOOLCHAIN_BUILDROOT_CXX.
      - Fix comment dependency, there should be an || between all the
        toolchain dependencies. Also fix the dependency on Qt5 for the
        comment, which was in the wrong way: the comment was displayed
        only when Qt5 was disabled.
      - Use -DDISABLE_WERROR=TRUE instead of -DDISABLE_WERROR=y, since
        TRUE/FALSE are normally the accepted values for CMake options.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
