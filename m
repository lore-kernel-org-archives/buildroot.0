From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 12 Feb 2013 12:47:30 +0200
Subject: [Buildroot]  [PATCH 0/1] [Re-submitted] openpgm: new package
Message-ID: <1360666051-16475-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch has been improved according to community suggestions:
- legal information supplied;
- OPENPGM_SUBDIR is used instead of a post extract hook;
- more recent release of the package is used;
- cross-compilation fix uses cached values instead of hard-coded ones.

The last thing has been implemented as recommended in Autoconf manual
(http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Runtime.html#Runtime)
for cross-compilation-friendly runtime tests. Direct caching of
pgm_unaligned_pointers variable produced a warning during autoreconfigure
that said that only variables containing _cv_ were cached, and
ac_cv_lbl_unaligned_fail was already used in Buildroot, so I based the
test on that one and set pgm_unaligned_pointers later from its result.

Re-submitted patch: [PATCH 1/1] openpgm: new package

--
Best regards,
  Alexander Lukichev
