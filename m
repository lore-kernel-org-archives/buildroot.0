From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 18:14:03 +0300
Subject: [Buildroot] [PATCH 0/4] Update WPE WebKit, Cog,
 and their dependencies
Message-ID: <20210518151407.264769-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

WPE WebKit 2.32.0 was released by the end of March, but I have been waiting
for 2.32.1 before submitting a patch set to update. The reasons are mainly
two:

  - I knew that fixes to build WPE WebKit against Musl would land on time
    for 2.32.1; which allows removing a patch we have been carrying in
	Buildroot.
  - While working on the release candidates for WPEBackend-fdo, we found
    a number of regressions, which delayed things while trying to solve
	all the issues found. Except for a minor issue, the rest are now all
	solved in 1.9.92. This is still a release candidate, but very stable
	in my experience. If there are concerns with it, I can change the
	patch to use 1.8.4 instead, which has backports of the changes.

Cheers,
-Adrian


Adrian Perez de Castro (4):
  package/libwpe: bump to version 1.10.0
  package/wpebackend-fdo: bump to version 1.9.92
  package/wpewebkit: bump to version 2.32.1
  package/cog: bump to version 0.10.0

 package/cog/cog.hash                          |  8 +-
 package/cog/cog.mk                            |  2 +-
 ...ial-dependency-to-pass-EGL-module-fl.patch | 45 -----------
 package/libwpe/libwpe.hash                    |  8 +-
 package/libwpe/libwpe.mk                      |  2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash    |  8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |  2 +-
 .../wpewebkit/0001-Fix-build-with-musl.patch  | 79 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 +-
 package/wpewebkit/wpewebkit.mk                |  2 +-
 10 files changed, 20 insertions(+), 144 deletions(-)
 delete mode 100644 package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch
 delete mode 100644 package/wpewebkit/0001-Fix-build-with-musl.patch

-- 
2.31.1
