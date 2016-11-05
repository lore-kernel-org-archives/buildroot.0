From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:33:25 +0100
Subject: [Buildroot] [PATCH 1/2] makedevs: resync device creation with
 upstream busybox
In-Reply-To: <20161105133812.18485-1-arnout@mind.be>
References: <20161105133812.18485-1-arnout@mind.be>
Message-ID: <20161105233325.5d8c9939@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Nov 2016 14:38:11 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> In upstream busbyox, the code to create devices has been simplified:
> the code for a single and for multiple devices is no longer duplicated.
> 
> Since we are going to change the device creation code next, it's
> convenient to have only one copy to modify.
> 
> There are two behavioural changes with this, but they were introduced
> silently together with other commits in upstream busybox.
> 
> - When mknod() fails, the chmod was still done. This is pointless so it
>   is no longer done now.
> 
> - There was a check for mode != -1; however, a mode of -1 would not
>   have worked anyway because all bits would be set for mknod(), which
>   would fail. So this check is redundant.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/makedevs/makedevs.c | 47 +++++++++++++++------------------------------
>  1 file changed, 15 insertions(+), 32 deletions(-)

Both applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
