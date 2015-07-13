From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:02:45 +0200
Subject: [Buildroot] [PATCH v4 2/9] Makefile: don't depend on current
 skeleton/overlay permissions
In-Reply-To: <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150713170245.42cbf089@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:19:01 -0300, Guido Mart?nez wrote:
> We use 'rsync -a' to copy the skeleton and overlays, so the target ends
> up with the exact same permissions as on the repo. The problem is we
> don't track these permissions, since Git doesn't allow for that (except
> for the exec bit). This means users with different umasks at the time of
> cloning could end up with different target permissions.
> 
> Fix this by using --chmod on rsync calls so we don't depend on the
> current permission set for the skeleton and overlays. We do depend on
> the exec bit, but that's fine since that one is tracked by Git.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
