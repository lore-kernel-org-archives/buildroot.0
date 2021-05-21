From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 21 May 2021 13:37:35 +0300
Subject: [Buildroot] [PATCH v3 0/2] Update to latest libsoup2
In-Reply-To: <20210520110926.1592027-1-aperez@igalia.com>
References: <20210520110926.1592027-1-aperez@igalia.com>
Message-ID: <20210521103737.3802646-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

While working on the WebKit package updates the last days I noticed that the
version of libsoup2 in Buildroot is a tad old, and it seemed fitting to submit
a patch set for updating it. Recent versions have a new dependency on libpsl,
so a new package for it is added as well.

Cheers,
-Adrian

Adrian Perez de Castro (2):
  package/libpsl: new package
  package/libsoup: bump to version 2.66.5

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/libpsl/Config.in                      |  8 ++++++
 package/libpsl/libpsl.hash                    |  6 +++++
 package/libpsl/libpsl.mk                      | 27 +++++++++++++++++++
 .../0001-Revert-tld-parser-use-Python-3.patch | 27 -------------------
 package/libsoup/Config.in                     |  1 +
 package/libsoup/libsoup.hash                  |  4 +--
 package/libsoup/libsoup.mk                    | 20 +++++++-------
 9 files changed, 56 insertions(+), 39 deletions(-)
 create mode 100644 package/libpsl/Config.in
 create mode 100644 package/libpsl/libpsl.hash
 create mode 100644 package/libpsl/libpsl.mk
 delete mode 100644 package/libsoup/0001-Revert-tld-parser-use-Python-3.patch

-- 
2.31.1
