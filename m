From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 May 2019 10:36:34 +0200
Subject: [Buildroot] [git commit] package/python: security bump to version
 2.7.16
Message-ID: <20190517083327.AB8CE8B51B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c970d7d64050bbae1ad81a841d4baff50139c973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
