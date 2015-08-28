From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:03:06 +0200
Subject: [Buildroot] [PATCH 1/1] libpam-radius-auth: new package
In-Reply-To: <1440017208-14421-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
References: <1440017208-14421-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
Message-ID: <20150828110306.081d5f48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giovanni,

Thanks for this patch!

On Wed, 19 Aug 2015 17:46:48 -0300, giovanni.zantedeschi wrote:
> From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>
> 
> Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
> ---
>  package/Config.in                                |  1 +
>  package/libpam-radius-auth/Config.in             |  6 ++++++
>  package/libpam-radius-auth/libpam-radius-auth.mk | 25 ++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 package/libpam-radius-auth/Config.in
>  create mode 100644 package/libpam-radius-auth/libpam-radius-auth.mk

I've applied it to the next branch, but I had to do quite a bit of
changes beforehand:

    [Thomas:
      - make libpam-radius-auth depend on linux-pam (since it's a
        linux-pam plugin, it needs some header files from linux-pam) by
        adding a "if BR2_PACKAGE_LINUX_PAM...endif" block in
        package/Config.in. This way, we will be grouping all the Linux PAM
        plugins together.
      - Fix the indententation in the Config.in file.
      - Use a better Config.in help text, copy/pasted from the website.
      - Use a tarball instead of github. This allows to remove
        AUTORECONF=YES.
      - Add linux-pam as a dependency.
      - Use $(TARGET_CONFIGURE_OPTS) instead of passing just CC/LD, but
        pass it in the environment rather than as options so that the
        CFLAGS/LDFLAGS added by the package Makefile are still taken into
        account.
      - Use mkdir -p + cp -dpfr instead of $(INSTALL) -D since we are
        copying multiple files.
      - Add a hash file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
