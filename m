From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 21:10:26 +0100
Subject: [Buildroot] [PATCH 02/30] ustr: new package
In-Reply-To: <1418702062-61039-3-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1418702062-61039-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150101211026.743843c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 15 Dec 2014 21:53:54 -0600, Matt Weber wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Config.in                                  |   1 +
>  .../ustr/0001-cross-compile-modifications.patch    | 144 +++++++++++++++++++++
>  package/ustr/Config.in                             |  11 ++
>  package/ustr/ustr.mk                               |  48 +++++++
>  4 files changed, 204 insertions(+)
>  create mode 100644 package/ustr/0001-cross-compile-modifications.patch
>  create mode 100644 package/ustr/Config.in
>  create mode 100644 package/ustr/ustr.mk

Thanks, applied after doing a bunch of changes:

[Thomas:
 - Fix typo in patch description.
 - Remove trailing whitespace in Config.in.
 - Fix Config.in comment to match what's specified in the Buildroot
   manual.
 - Adjust .mk logic to use BR2_STATIC_LIBS vs. BR2_SHARED_LIBS instead
   of BR2_PREFER_STATIC_LIB, and therefore support the installation of
   only the shared library.
 - Remove the libustr-debug library from the target and staging
   directories, it's the same as libustr, except that it's compiled
   with debugging symbols.
 - Always install only the shared variant of the library for
   host-ustr.]

Could you work with upstream to submit the
0001-cross-compile-modifications.patch stuff? Their build system is
really completely brain-damaged. Making them use autoconf/automake
would be a vast improvement over the crappy manual Makefile they are
using today.

See
http://git.buildroot.net/buildroot/commit/?id=5cefca4cc3da4fc5e6649aa3ae3a828df3d09a44
for the final commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
