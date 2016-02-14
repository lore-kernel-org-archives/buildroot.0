From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Feb 2016 00:01:50 +0100
Subject: [Buildroot] [PATCH v2 1/2] systemd: fix dbus activation
In-Reply-To: <1455147844-4918-1-git-send-email-gabe@hashrabbit.co>
References: <1454971831-11139-1-git-send-email-gabe@hashrabbit.co>
 <1455147844-4918-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160215000150.5ef86164@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Wed, 10 Feb 2016 23:44:03 +0000, Gabe Evans wrote:
> Various DBus activated services fail to start with errors similar to:
> 
>   Unit dbus-org.freedesktop.hostname1.service failed to load: File exists.
> 
> The message itself is rather vague and can be seen as a warning in
> systemd-networkd logs. Meanwhile, tools like hostnamectl don't work
> at all.
> 
> The post-install target hook SYSTEMD_SANITIZE_PATH_IN_UNITS was replacing
> symlinks with duplicate files. The find command could have used -type f
> to avoid this but I instead chose to remove the hook since this fix doesn't
> seem to be needed anymore.
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v1 -> v2:
>   - split changes into two separate commits (suggested by Arnout)
> ---
>  package/systemd/systemd.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
