From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:14:34 +0100
Subject: [Buildroot] [PATCH] Revert "runc: bump to v1.0.0-rc4"
In-Reply-To: <20171117170027.3347-1-peter@korsgaard.com>
References: <20171117170027.3347-1-peter@korsgaard.com>
Message-ID: <20171122221434.3a8c0127@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Nov 2017 18:00:27 +0100, Peter Korsgaard wrote:
> This reverts commit 3861ce09d0acd6425873332300c6caa75863017f.
> 
> As reported on IRC, runc v1.0.0-rc4 is not compatible with the docker-engine
> version we are using, so lets revert for 2017.11:
> 
> 20:27 < eschu> It looks like 25 days ago buildroot had runc updated to
>                1.0.0-rc4, which breaks compatibility with the docker-engine
>                version 17.05.  Is there somewhere issues like this are
>                reported?  Or is it just expected on non-release versions of
>                buildroot?
> 
> 20:47 < Jacmet> eschu: ahh, so the new runc doesn't work with the old
>                 docker-engine?  what kind of errors do you get exactly?
> 
> 20:49 < eschu> Jacmet:  yes, runc made a change from -console to
>                --console-socket, which results in "Incorrect Usage" error
>                "flag provided but not defined: -console"
> 
> 20:51 < eschu> Jacmet:  basically docker-engine 17.05 uses -console, but
>                support for that was cut off in runc around the first 1.0.0
>                versions.  I'll check the patches out, or might just
>                downgrade to buildroot 2017.08 release
> 
> 20:51 < agb> Jacmet: unfortunately this issue has hit a number of distributions
>              https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=877146
> 
> 20:53 < Jacmet> agb: thanks.  I'll send a revert for 2017.11 and hopefully
>                 we can make progress on the other docker packages for
>                 2018.02
> 
> Cc: Christian Stewart <christian@paral.in>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
