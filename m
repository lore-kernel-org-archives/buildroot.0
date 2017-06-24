From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:50:05 +0200
Subject: [Buildroot] [PATCH v2] support/scripts: allow /etc/shadow to be
 symlinked
In-Reply-To: <20170612133554.24995-1-mail@jens-maus.de>
References: <20170608152622.30019-1-mail@jens-maus.de>
 <20170612133554.24995-1-mail@jens-maus.de>
Message-ID: <20170624175005.49a41974@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 15:35:54 +0200, Jens Maus wrote:
> This commit fixes a problem where it was not possible to replace
> /etc/shadow with a symlink to a e.g. a user partition where the
> shadow file is placed. This is required, e.g. for systems where the
> rootfs is mounted read-only but users should still be able to be
> added. Thus, if within an filesystem overlay setup a user tries
> to replace /etc/shadow with a symlink to the real file on a user
> partition a buildroot build stops with an error message because
> sed is called on the symlink instead of following the symlink.
> This commit fixes this shortcoming.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> 
> ---
> Changes v1 -> v2:
>   - extended follow-symlinks use (requested by Yann)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
