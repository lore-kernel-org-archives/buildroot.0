From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:48:25 +0200
Subject: [Buildroot] [PATCH 0/7] Add a gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328204825.GR24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-03-28 21:13 +0200, Thomas Petazzoni spake thusly:
> Here is a small patch series that adds a gitlab macro, similar to the
> github macro. What prompted me to add this is a pending patch for a
> package, which uses gitlab, but does a git clone instead of relying on
> gitlab tarballs.

Although tht is my personal preferenc, to use the git download backend
for git-hosted source, rather than use remotely generated tarballs, I've
still applied the entire series as-is, because that makes gitlab on-par
with github, and the consensus among mantainers was not clear-cut.

Still, I'd like to remind everyone that git trees are cached lcoally,
which may make for a slower first-step, but is supposed to gfreatly
increase subsequent downloads and updates. The local git cache has been
quite some work, and not usign it is quite a bit of a waste..

Anyway: entire series applied, thanks!

Regards,
Yann E. MORIN.

> Hopefully, having a gitlab macro will make it more obvious how we
> prefer to handle things.
> 
> This series also has a preparation patch improving some details about
> the github macro.
> 
> Thanks,
> 
> Thomas
> 
> Thomas Petazzoni (7):
>   docs/manual: improve details about the Github macro
>   package/pkg-download.mk: add gitlab macro
>   docs/manual: add documentation for the gitlab macro
>   package/eigen: use gitlab macro
>   package/frotz: use gitlab macro
>   package/ipcalc: use gitlab macro
>   package/libsoundtouch: use gitlab macro
> 
>  docs/manual/adding-packages-tips.txt   | 40 ++++++++++++++++++++++++--
>  package/eigen/eigen.mk                 |  2 +-
>  package/frotz/frotz.mk                 |  2 +-
>  package/ipcalc/ipcalc.mk               |  2 +-
>  package/libsoundtouch/libsoundtouch.mk |  2 +-
>  package/pkg-download.mk                |  3 ++
>  6 files changed, 45 insertions(+), 6 deletions(-)
> 
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
