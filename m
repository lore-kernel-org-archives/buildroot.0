From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Sep 2012 17:43:43 +0200
Subject: [Buildroot] [PATCH 0/12] Rework the gettext handling
Message-ID: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series is an aggregation of the gettext rework by Maxime, Thomas,
and I.

See this post for the 6 first patches:
http://lists.busybox.net/pipermail/buildroot/2012-July/055871.html

    [PATCH 01/12] gettext: remove option to build statically
    [PATCH 02/12] gettext: remove the gettext-target make target, unused
    [PATCH 03/12] gettext: remove libintl handling
    [PATCH 04/12] Remove all references to libintl
    [PATCH 05/12] gettext: convert to autotools-package
    [PATCH 06/12] doc: update after gettext changes

The following 2 patches fix two packages in preparation for the end of the
series:

    [PATCH 07/12] package/lshw: add missing dependency on gettext
    [PATCH 08/12] package/pulseaudio: fix build-dependency on gettext

See this post for an explanation for the next 4 patches:
http://lists.busybox.net/pipermail/buildroot/2012-August/058042.html

    [PATCH 09/12] toolchain/common: rename BR2_NEEDS_GETTEXT
    [PATCH 10/12] pkg-infra: ensure gettext gets built before all other packages
    [PATCH 11/12] toolchain/common: introduce blind options BR2_NEEDS_GETTEXT{,_IF_LOCALE}
    [PATCH 12/12] packages: use the new gettext mechanism

The complete series has been build-tested with all packages touched by the
series. Except for gmpc, which fails to build because it does not link with
-lm (thus has missing symbol floor(3) with my uClibc-based toolchain), all
other packages were built OK.

Regards,
Yann E. MORIN.
