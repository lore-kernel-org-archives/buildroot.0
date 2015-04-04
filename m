From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:11:44 +0200
Subject: [Buildroot] [PATCH v2 5/8] package/openjpeg: New package
 openjpeg 1.5.2
In-Reply-To: <1427058772-1105-6-git-send-email-olivier.schonken@gmail.com>
References: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
 <1427058772-1105-6-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150404111144.72c34696@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 22 Mar 2015 23:12:49 +0200, Olivier Schonken wrote:
> This package is needed by Poppler.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/Config.in              |  1 +
>  package/openjpeg/Config.in     |  6 ++++++
>  package/openjpeg/openjpeg.hash |  2 ++
>  package/openjpeg/openjpeg.mk   | 15 +++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/openjpeg/Config.in
>  create mode 100644 package/openjpeg/openjpeg.hash
>  create mode 100644 package/openjpeg/openjpeg.mk

Thanks, applied, after doing a small number of changes:

    [Thomas:
     - fix download location, which was incorrect.
     - add dependency on host-pkgconf, since the configure.ac script uses
       PKG_CHECK_MODULES and we're doing an autoreconf.
     - add optional dependencies on libpng, tiff and lcms2, so that they
       are explicit instead of automatically detected.]

Note that this patch should have been *before* the poppler bump in the
series, since the poppler bump depends on openjpeg.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
