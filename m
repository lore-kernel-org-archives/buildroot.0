From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 03 Nov 2012 19:09:17 +0100
Subject: [Buildroot] [PATCH] pkg-download: Make a shallow clone for git
 downloads
In-Reply-To: <1351732866-29730-1-git-send-email-arnout@mind.be>
References: <1351732866-29730-1-git-send-email-arnout@mind.be>
Message-ID: <50955DCD.1050203@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> When downloading from git, we clone the whole repository and then only
> use the latest commit.  That's a lot of redundant stuff.  So instead,
> make a shallow clone.  Unfortunately that's only possible when
> downloading a branch or tag, so fall back to the old method if git gives
> an error.
>
> This speeds up the cloning of a linux git from more than 2 hours to
> 20 minutes on a 200KB/s link).
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

But as discussed during the Buildroot Developer Days, the git
downloader is growing in size and it's probably worth moving it to a
helper script.

Luca
