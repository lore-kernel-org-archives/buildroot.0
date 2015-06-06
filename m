From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 03:13:32 +0200
Subject: [Buildroot] [PATCH 1/1] opkg: bump to version 0.3.0
In-Reply-To: <1433548291-27182-1-git-send-email-vsergeev@gmail.com>
References: <1433548291-27182-1-git-send-email-vsergeev@gmail.com>
Message-ID: <20150606031332.16b1f4ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vanya Sergeev,

On Fri,  5 Jun 2015 16:51:31 -0700, Vanya Sergeev wrote:
> Remove "Disable tests and manpages" patch because opkg no longer builds C tests
> into libopkg as of commit ef8ae066cfa898b6366198e429cbeb4c94c92939.
> 
> Remove "Fix libtool issue with recent libtool" patch because the patch comments
> indicate that it is no longer required with opkg version 0.3.0.
> 
> Select libarchive package dependency, as opkg requires it as of release
> opkg-0.3.0-rc0 (see the opkg NEWS file).
> 
> Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
> ---
>  package/opkg/0001-Disable-tests-and-manpages.patch | 35 ----------------------
>  ...002-Fix-libtool-issue-with-recent-libtool.patch | 35 ----------------------
>  package/opkg/Config.in                             |  1 +
>  package/opkg/opkg.mk                               |  2 +-
>  4 files changed, 2 insertions(+), 71 deletions(-)
>  delete mode 100644 package/opkg/0001-Disable-tests-and-manpages.patch
>  delete mode 100644 package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch

Applied, thanks. However, I had to fix one thing: you forgot to
propagate the wchar dependency of libarchive to opkg.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
