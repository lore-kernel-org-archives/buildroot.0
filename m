From: Julien Floret <julien.floret@6wind.com>
Date: Sat,  2 Jul 2016 20:48:32 +0200
Subject: [Buildroot] [RFC 0/3] Remove auto derivation of host dependencies
Message-ID: <1467485315-28264-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The auto derivation of host dependencies feature consists in
automatically deducing dependencies of host variant of a package
from the dependencies of the target variant.

However, it causes some issues, and most host packages need different
dependencies than their target variants.

The goal of this RFC is to remove this feature, after having
set explicit dependencies for all host packages.

There are about 60 packages impacted, in this series I only take 2
packages as example (zip and erlang-lager).
I will send an applicable patch series later with all packages if
feedbacks are positive.

Note that this has not been intensively tested, it is possible that I
missed something.

Julien Floret (3):
  zip: add explicit dependencies for host variant
  erlang-lager: add explicit dependencies for host variant
  infra: remove auto derivation of host dependencies

 package/erlang-lager/erlang-lager.mk |  1 +
 package/pkg-autotools.mk             |  9 ---------
 package/pkg-cmake.mk                 |  7 -------
 package/pkg-generic.mk               |  4 ----
 package/pkg-python.mk                | 15 ---------------
 package/pkg-rebar.mk                 | 14 --------------
 package/pkg-virtual.mk               |  7 -------
 package/zip/zip.mk                   |  1 +
 8 files changed, 2 insertions(+), 56 deletions(-)

-- 
2.1.0
