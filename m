From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Feb 2015 22:14:44 +0100
Subject: [Buildroot] [git commit] legacy: add missing option for
 util-linux' wdctl
In-Reply-To: <20150208204619.EC9BE805FE@busybox.osuosl.org>
References: <20150208204619.EC9BE805FE@busybox.osuosl.org>
Message-ID: <20150208221444.3ad4515f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 8 Feb 2015 09:20:29 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=8d702aca30d4b0314bc503c9015becb132d380bc
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> In 349c9c7 (package/util-linux: add more tool select options), the
> util-linux' wdctl option was renamed, but a entry in the legacy menu was
> no added.
> 
> Add this now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I believe this patch is not necessary. The BR2_PACKAGE_WDCTL option
indeed existed, but it had never done anything. So if someone had
BR2_PACKAGE_WDCTL enabled in his .config, nothing was happening prior
to 349c9c7fac4bf8cd7d781e8aab6edc47b7ceb7c2 (which renamed the option
to the proper name). And after 349c9c7fac4bf8cd7d781e8aab6edc47b7ceb7c2
has been applied, BR2_PACKAGE_WDCTL continues to do nothing.

Adding Config.in.legacy handling for this is therefore useless.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
