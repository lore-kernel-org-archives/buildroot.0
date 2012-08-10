From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 10 Aug 2012 06:51:48 -0400
Subject: [Buildroot]  [PATCH] Add package linux-pam
In-Reply-To: <CADiAo4+Ak_6ZLY0ND=ZYWz6wTsov4XnkpXvbK8ZSF-ukU7ALGw@mail.gmail.com>
References: <1344569575-25960-1-git-send-email-golubovsky@gmail.com>
 <20120810094139.12fbf1f2@skate>
 <CADiAo4+Ak_6ZLY0ND=ZYWz6wTsov4XnkpXvbK8ZSF-ukU7ALGw@mail.gmail.com>
Message-ID: <CADiAo4LswvFLPT4cJpSX6S=gbJxOxa51dv1kTuprF+iXgk-SqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Aug 10, 2012 at 3:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>
> Each of your patches should contain a header with a description +
> Signed-off-by line. See
> package/libfcgi/libfcgi-link-against-libfcgi-la.patch for example.
>

Added.

>
> This line is not needed, please remove.
>

I removed it. However it is still there in few places:

$ grep -rl "INSTALL_TARGET = YES" package/
package/libglib2/libglib2.mk
package/libgtk2/libgtk2.mk

And surely install to target is needed for PAM (security modules)

>
> We generally format this in a different way:
>
> LINUX_PAM_CONF_OPT = \
>         --disable-prelude \
>         --disable-isadir  \
>         --disable-nis     \
>         --disable-regenerate-docu \
>         --enable-securedir=/lib/security \
>         --libdir=/lib

Fixed.

> I think libintl should be part of the $(if
> $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) conditional: when building with
> a glibc toolchain, BR2_NEEDS_GETTEXT_IF_LOCALE will be false, because
> glibc has a builtin version of libintl.

Fixed.


>
> Instead of overriding LINUX_PAM_BUILD_CMDS, I would recommend using:
>
> LINUX_PAM_CONF_ENV += \
>         CC="$(TARGET_CC) -lintl -lfl"

This gives me configure error "compiler cannot create executables" so
I left this unchanged.

Thanks.

--
Dmitry Golubovsky

Anywhere on the Web


-- 
Dmitry Golubovsky

Anywhere on the Web
