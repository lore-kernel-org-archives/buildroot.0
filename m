From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Aug 2017 23:54:27 +0200
Subject: [Buildroot] [PATCH] autobuild-run: fix retrieving the gitid
In-Reply-To: <20170812094943.16460-1-yann.morin.1998@free.fr>
References: <20170812094943.16460-1-yann.morin.1998@free.fr>
Message-ID: <20170813235427.0e68fed2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Aug 2017 11:49:43 +0200, Yann E. MORIN wrote:
> Before 66f91eb (autobuild-run: add --repo option), we used to 'git pull'
> to update the local Buildroot clone. This had the side-effect of
> updating the local refs because we were pulling from 'origin'.
> 
> So 'origin/master' and 'master' were correctly updated.
> 
> But since the offending commit, we no longer pull, and we instead fetch
> from an explicit repository, which never updates 'origin/master' nor
> 'master'. Instead, they both are stuck at the time the repository was
> cloned, or at the time the autobuild script was updated.
> 
> We fix that by just dropping the 'master' ref from the git log so that
> the log applies to the commit for current working copy.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to buildroot-test. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
