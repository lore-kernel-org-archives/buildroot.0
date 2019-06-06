From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 08:43:01 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python: security
 bump to version 2.7.16
Message-ID: <20190606064907.4A3DF81347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e205b10c06039cb9932470846132772e2fe992a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2013-1752: Change use of readline() in :class:`imaplib.IMAP4_SSL` to limit line length

- CVE-2018-14647: The C accelerated _elementtree module now initializes hash
  randomization salt from _Py_HashSecret instead of libexpat's default
  CSPRNG.

For more details, see the NEWS file:
https://github.com/python/cpython/blob/v2.7.16/Misc/NEWS.d/2.7.16rc1.rst

Refresh patches, drop now upstream
package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
and adjust hash of LICENSE file for a change of copyright years.

run-tests results:
16:05:41 TestPython2                              Starting
16:05:42 TestPython2                              Building
16:11:26 TestPython2                              Building done
16:11:32 TestPython2                              Cleaning up
