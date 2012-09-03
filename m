From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Sep 2012 00:02:50 +0200
Subject: [Buildroot] [PATCH 0/11 v2] Rework the gettext handling
Message-ID: <1346709781-18158-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series is an aggregation of the gettext rework by Samuel,
Maxime, Thomas, and I.

See this post for the 6 first patches:
http://lists.busybox.net/pipermail/buildroot/2012-July/055871.html

    [PATCH 01/11] gettext: remove option to build statically
    [PATCH 02/11] gettext: remove the gettext-target make target, unused
    [PATCH 03/11] gettext: remove libintl handling
    [PATCH 04/11] Remove all references to libintl
    [PATCH 05/11] gettext: convert to autotools-package
    [PATCH 06/11] doc: update after gettext changes

The following 2 patches fix two packages in preparation for the end of the
series:

    [PATCH 07/11] package/lshw: add missing dependency on gettext
    [PATCH 08/11] package/pulseaudio: fix build-dependency on gettext

See this post for an explanation for the next 3 patches:
http://lists.busybox.net/pipermail/buildroot/2012-August/058042.html

    [PATCH 09/11] toolchain/common: rename BR2_NEEDS_GETTEXT
    [PATCH 10/11] toolchain/common: introduce blind options BR2_NEEDS_GETTEXT{,_IF_LOCALE}
    [PATCH 11/11] packages: use the new gettext mechanism

The complete series has been build-tested with all packages touched by the
series. Except for gmpc, which fails to build because it does not link with
-lm ( was already broken before this series), all other impacted packages
were built OK (albeit using a great deal of electrons in the process! ;-) ).

Changes since v1:
  - drop the gettext-before-all patch (Arnout, Thomas)
  - keep and simplify build-dependency against gettext (Arnout)
  - add config-dependency against gettext for diffutils, flex, ndisc6
    and util-linux, in patch 11
  - rebase on-top latest tree (and upgrade new package linux-pam in the
    process)
  - update doc
  - add Tested-by and Acked-by Arnout were he said so
  - CC: Samuel Martin as a recognition for his original work on this topic,
    which this series is based on. (Arnout)

Regards,
Yann E. MORIN.
