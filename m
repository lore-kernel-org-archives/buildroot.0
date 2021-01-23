From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:34:08 +0100
Subject: [Buildroot] [PATCH] perl: bump to version 5.32.0
In-Reply-To: <20210122183046.874944-1-francois.perrad@gadz.org>
References: <20210122183046.874944-1-francois.perrad@gadz.org>
Message-ID: <20210123213408.60d1c28b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 19:30:46 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...the-generated-subdirectory-Makefiles.patch | 32 -------------------
>  package/perl/perl.hash                        |  8 ++---
>  package/perl/perl.mk                          |  6 ++--
>  utils/scancpan                                |  8 ++---
>  4 files changed, 11 insertions(+), 43 deletions(-)
>  delete mode 100644 package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch

This commit breaks "make perl-legal-info":

>>> perl 5.32.0 Collecting legal info
Artistic: OK (sha256: dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2)
Copying: OK (sha256: d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912)
ERROR: README has wrong sha256 hash:
ERROR: expected: 4916e95d32b84e07c045d839646f74996f577e5f497bbba8177a94b31415cee7
ERROR: got     : f3742c110e125e5078745d71eb55059a672f933a8450ae9e8a807bfe685caf94
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Also, you're updating perl, but not perl-cross. Is the perl-cross
version we use still compatible, with no changes, with perl 5.32.0 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
