From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:25:04 +0200
Subject: [Buildroot] [PATCH] package/valgrind: bump to version 3.15.0
In-Reply-To: <1556110027-11297-1-git-send-email-stefan.maksimovic@rt-rk.com>
References: <1556110027-11297-1-git-send-email-stefan.maksimovic@rt-rk.com>
Message-ID: <20190424212504.42aa3ce6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Apr 2019 14:47:07 +0200
Stefan Maksimovic <stefan.maksimovic@rt-rk.com> wrote:

> Additionally, provide a patch with which valgrind
> can be now compiled for MIPS32r6/MIPS64r6 and
> reenable it in the config file.
> 
> Moreover, remove a patch which is not needed anymore
> since https://bugs.kde.org/show_bug.cgi?id=400975
> has been resolved.
> 
> Signed-off-by: Stefan Maksimovic <stefan.maksimovic@rt-rk.com>
> ---
>  ...e.ac-disable-gcc-march-mips64r2-detection.patch | 49 ----------------------
>  ...x-mips32r6-and-mips64r6-compilation-issue.patch | 46 ++++++++++++++++++++
>  package/valgrind/Config.in                         |  7 +---
>  package/valgrind/valgrind.hash                     |  2 +-
>  package/valgrind/valgrind.mk                       |  5 +--
>  5 files changed, 49 insertions(+), 60 deletions(-)
>  delete mode 100644 package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
>  create mode 100644 package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch

Applied to master, thanks. It would have been better to clearly
indicate that the patch you are adding is backported from upstream.
I've amended the commit log, and the patch description itself, with
this information.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
