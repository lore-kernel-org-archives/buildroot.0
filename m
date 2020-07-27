From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 16:33:02 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/rocksdb: bump to version
 6.10.1
In-Reply-To: <20200530092849.3184353-1-fontaine.fabrice@gmail.com>
References: <20200530092849.3184353-1-fontaine.fabrice@gmail.com>
Message-ID: <20200727163302.3c6deb17@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 May 2020 11:28:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update indentation of hash file (two spaces)
> - Remove first patch (already in version)
> - Add link to upstream PR in second patch
> - Add upstream patch to fix build on powerpc (patch does not apply
>   cleanly on current version)
> - Update hash of README.md, slack forum added with
>   https://github.com/facebook/rocksdb/commit/cf342464caf8155ab60f7a48e39a8d6ae3138a7a
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/242db7139ce5dd6ece4a1eb50a1aa47c841a41b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../rocksdb/0001-Check-for-sys-auxv.h.patch   |  111 -
>  ...s-build_detect_platform-fix-C-tests.patch} |    1 +
>  ...e-POWER-crc32c-with-C-implementation.patch | 4058 +++++++++++++++++
>  package/rocksdb/rocksdb.hash                  |   10 +-
>  package/rocksdb/rocksdb.mk                    |    2 +-
>  5 files changed, 4065 insertions(+), 117 deletions(-)
>  delete mode 100644 package/rocksdb/0001-Check-for-sys-auxv.h.patch
>  rename package/rocksdb/{0002-build_tools-build_detect_platform-fix-C-tests.patch => 0001-build_tools-build_detect_platform-fix-C-tests.patch} (99%)
>  create mode 100644 package/rocksdb/0002-replace-POWER-crc32c-with-C-implementation.patch

The patch is really huge, but OK we don't have much choice here, so
I've applied to master.

Please note that newer versions have been released in the mean time,
though without the PPC patch. There is however a newer version of the
PPC patch at https://github.com/facebook/rocksdb/pull/7079/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
