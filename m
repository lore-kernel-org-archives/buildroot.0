From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 22:41:13 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
In-Reply-To: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
References: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180908224113.0e4f24bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Sep 2018 22:45:05 +0200, Thomas Petazzoni wrote:
> The Github repository at https://github.com/symless/synergy no longer
> exists, it has apparently been moved to
> https://github.com/symless/synergy-core.
> 
> On master as of 811734ef9044bbdfc067da76358153061fae2031, we use
> v1.8.8, which fails to download from github.com, so we fallback to
> sources.buildroot.net, which has the tarball.
> 
> However, on next as of 7da2748c9ef4e67a060ea7eb6ff23275da235daa, we
> use v2.1.0, which completely fails to download, as we don't have a
> backup tarball on sources.buildroot.net.
> 
> This commit fixes that by using the new upstream
> location. Unfortunately, the hash changes, because the prefix in the
> tarball is changed from synergy-1.8.8-stable/ to
> synergy-core-1.8.8-stable/. There are no other changes. This means
> that people having existing tarballs locally we'll see them being
> re-downloaded because the hash has changed.
> 
> Fixes (once applied to next):
> 
>   http://autobuild.buildroot.net/results/82ae9a378b70a3d27e78e1d80a63495b37329e16/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/synergy/Config.in    | 2 +-
>  package/synergy/synergy.hash | 2 +-
>  package/synergy/synergy.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Following the discussion with Arnout and Peter, I marked this patch as
"Changes Requested" (it was not merged in master prior to the 2018.08
release). And instead, I committed a fix in master now, only for the
v2.0.12-beta version of synergy. For this one, the hash of the tarball
was already correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
