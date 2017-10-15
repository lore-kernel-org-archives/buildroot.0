From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] ifupdown-scripts: Stop installing
 .empty files.
In-Reply-To: <20171015005719.16792-1-camh@xdna.net>
References: <20171015005719.16792-1-camh@xdna.net>
Message-ID: <20171015154744.77bf44f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Oct 2017 11:57:19 +1100, Cam Hutchison wrote:
> ifupdown-scripts has some .empty files to maintain empty directories in
> git. Previously this package used to be part of the skeleton which used
> SYSTEM_RSYNC to copy the directories to the target. When it was split
> into a separate package, cp -a was used to do the copy instead, which
> copies the .empty files.
> 
> Change to SYSTEM_RSYNC which excludes .empty files.
> 
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  package/ifupdown-scripts/ifupdown-scripts.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
