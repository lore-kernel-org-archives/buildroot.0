From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:16:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.9.0
In-Reply-To: <20180915181630.32105-1-bernd.kuhls@t-online.de>
References: <20180915181630.32105-1-bernd.kuhls@t-online.de>
Message-ID: <20180916151658.1964c10a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Sep 2018 20:16:30 +0200, Bernd Kuhls wrote:
> Release notes: https://www.samba.org/samba/history/samba-4.9.0.html
> 
> Added optional dependency to libarchive to fix configure error:
> 
> Checking for libarchive existence
> Checking for header archive.h        : no
> /home/buildroot/br5/output/build/samba4-4.9.0/source3/wscript:225:
>  error: libarchive support not found. Try installing libarchive-dev or
>  libarchive-devel. Otherwise, use --without-libarchive to build without
>  libarchive support. libarchive support is required for the smbclient
>  tar-file mode
> 
> Disabled gpgme support to fix configure error:
> 
> Checking for program gpgme-config    : not found
> Checking for library gpgme           : not found
> Checking for gpgme_new               : not found
> /home/buildroot/br5/output/build/samba4-4.9.0/source4/dsdb/samdb/ldb_modules/wscript:40:
>  error: GPGME support not found. Try installing libgpgme11-dev or
>  gpgme-devel and python-gpgme. Otherwise, use --without-gpgme to build
>  without GPGME support or --without-ad-dc to build without the Samba AD
>  DC. GPGME support is required for the GPG encrypted password sync
>  feature
> 
> Buildroot has no python-gpgme package atm so we disable this option
> for now.
> 
> Disabled experimental LMDB LDB backend as well, this also needed an
> addition to samba4-cache.txt.
> 
> AD DC support needs jansson, for details see release notes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/Config.in        |  1 +
>  package/samba4/samba4-cache.txt |  1 +
>  package/samba4/samba4.hash      |  4 ++--
>  package/samba4/samba4.mk        | 17 ++++++++++++++---
>  4 files changed, 18 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
