From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 00:19:59 +0100
Subject: [Buildroot] [PATCH v5 1/1] package/gutenprint: Un-deprecate and
 bump version to 5.2.11
In-Reply-To: <1453664973-21165-1-git-send-email-olivier.schonken@gmail.com>
References: <1453664973-21165-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160221001959.3c65b74d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 24 Jan 2016 21:49:33 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
> Changes V4 -> V5
> Updated Gutenprint with recently released 5.2.11
> Added patch to fix endianness detection. Will submit upstream
>  ...-print-olympus.c-fix-endianness-detection.patch | 33 ++++++++++++++++++++++
>  package/gutenprint/Config.in                       |  2 --
>  package/gutenprint/gutenprint.hash                 |  2 +-
>  package/gutenprint/gutenprint.mk                   |  2 +-
>  4 files changed, 35 insertions(+), 4 deletions(-)
>  create mode 100644 package/gutenprint/0003-print-olympus.c-fix-endianness-detection.patch

This package didn't build, because host-gutenprint was missing a
dependency on host-pkgconf. This dependency is needed because we
autoreconf host-gutenprint, and configure.ac uses PKG_CHECK_MODULES(),
whose definition is only available if host-pkgconf has been built.

I've added this dependency to host-gutenprint, and applied your patch
to the next branch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
