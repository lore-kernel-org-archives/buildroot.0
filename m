From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 5 Nov 2016 13:03:26 -0200
Subject: [Buildroot] [PATCH 1/2] makedevs: resync device creation with
 upstream busybox
In-Reply-To: <20161105133812.18485-1-arnout@mind.be>
References: <20161105133812.18485-1-arnout@mind.be>
Message-ID: <CAOMZO5DOSD4HezdQYJ6tQ43q_kCZHx7J9qQrUwpsanYCijDBJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 5, 2016 at 11:38 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
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

Tested-by: Fabio Estevam <festevam@gmail.com>
