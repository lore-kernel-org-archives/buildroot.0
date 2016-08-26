From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 16:01:32 +0200
Subject: [Buildroot] [PATCH] blktrace: re-enable on uClibc
In-Reply-To: <1471963200-18857-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471963200-18857-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160826160132.18059f0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 16:40:00 +0200, Thomas Petazzoni wrote:
> With a small patch, blktrace can work on uClibc: we simply need to link
> with librt to use the posix_spawn*() functions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../blktrace/0001-iowatcher-link-with-lrt.patch    | 29 ++++++++++++++++++++++
>  package/blktrace/Config.in                         |  6 -----
>  2 files changed, 29 insertions(+), 6 deletions(-)
>  create mode 100644 package/blktrace/0001-iowatcher-link-with-lrt.patch

I've applied to next, after adding in the patch a reference to the
upstream commit, since my fix has already been merged upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
