From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 16:16:56 +0100
Subject: [Buildroot] [PATCH 1/2] libvncserver: bump version to 0.9.10
In-Reply-To: <19e3ab6547ff31fb2f50e976e6ac5394@to-the-max.net>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
 <20141226044006.GT6400@tarshish>
 <19e3ab6547ff31fb2f50e976e6ac5394@to-the-max.net>
Message-ID: <20141226151656.GD3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2014-12-26 16:03 +0100, Floris Bos spake thusly:
> On 26.12.2014 05:40, Baruch Siach wrote:
> >>diff --git a/package/libvncserver/libvncserver.mk
> >>b/package/libvncserver/libvncserver.mk
> >>index 99d757b..b26d5b9 100644
> >>--- a/package/libvncserver/libvncserver.mk
> >>+++ b/package/libvncserver/libvncserver.mk
> >>@@ -4,13 +4,14 @@
> >> #
> >>################################################################################
> >>
> >>-LIBVNCSERVER_VERSION = 0.9.9
> >>+LIBVNCSERVER_VERSION = 0.9.10
> >> LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
> >>-LIBVNCSERVER_SITE = http://downloads.sourceforge.net/project/libvncserver/libvncserver/$(LIBVNCSERVER_VERSION)
> >>+LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
> >> LIBVNCSERVER_LICENSE = GPLv2+
> >> LIBVNCSERVER_LICENSE_FILES = COPYING
> >> LIBVNCSERVER_INSTALL_STAGING = YES
> >> LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
> >>+LIBVNCSERVER_AUTORECONF = YES
> >
> >Why is this needed? Please explain in a comment.
> 
> The autoreconf you mean?

Yes.

It is not often that a release tarball does not contain pre-generated
autotools files, so adding a comment saying so is required, like:

    # Upstream decided to remove generated autotools files from the
    # tarball, so we need to generate it:
    LIBVNCSERVER_AUTORECONF = YES

> No idea why exactly, but upstream no longer includes a ready-made configure
> script with the new release.
> Since it is mentioned in their changelog ("Cleaned out the autotools build
> system which now uses autoreconf") I assume it is intentional, instead of
> overlooked.

That's pretty much unusual not to bundle the generated configure. That
they be removed from the repository is understandable, of course, but
release tarballs usually have them, so users do not have to have the
autotools development stuff just to build the package.

But, he... If upstream does not want to bundle it... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
