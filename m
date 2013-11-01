From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 17:41:54 +0100
Subject: [Buildroot] [PATCH v2] rsync: use system zlib and popt,
 also do not lose debug options
In-Reply-To: <1381929217-13399-1-git-send-email-denis@mingulov.com>
References: <1381923631-26549-1-git-send-email-denis@mingulov.com>
 <1381929217-13399-1-git-send-email-denis@mingulov.com>
Message-ID: <20131101174154.39d2c0d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Denis Mingulov,

On Wed, 16 Oct 2013 16:13:37 +0300, Denis Mingulov wrote:
> rsync by default compiles statically its own zlib and popt
> libraries, it is better to use system wide libraries instead -
> both for disk and memory consumption. Change rsync package
> accordingly.
> 
> Also previously a debug configure option has been lost, as
> overwritten by '--with-included-popt' option - fixed.
> 
> For example, on ARMv5 rsync binary size is reduced by about 25%.
> 
> Signed-off-by: Denis Mingulov <denis@mingulov.com>
> ---
>  package/rsync/Config.in | 2 ++
>  package/rsync/rsync.mk  | 7 +++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
