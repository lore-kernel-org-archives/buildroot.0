From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:48:31 +0200
Subject: [Buildroot] [PATCH] package/systemd: better patch to avoid ln
 --relative
In-Reply-To: <20170401173813.23665-1-yann.morin.1998@free.fr>
References: <20170401173813.23665-1-yann.morin.1998@free.fr>
Message-ID: <20170403224831.26c98ff4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Apr 2017 19:38:13 +0200, Yann E. MORIN wrote:
> We currently have two patches that address the ln --relative issue
> differently. The first one changes the behaviour to generate absolute
> symlinks, which is incorrect; the second provides an ad-hoc solution
> for a single case.
> 
> Replace both of them with a single patch that mimics ln --relative when
> the host ln does not support it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  .../systemd/0002-build-check-for-ln-relative.patch | 96 ++++++++++++++++++++++
>  ...uild-sys-revert-use-of-ln-relative-option.patch | 72 ----------------
>  .../0004-install-don-t-use-ln-relative.patch       | 40 ---------
>  3 files changed, 96 insertions(+), 112 deletions(-)
>  create mode 100644 package/systemd/0002-build-check-for-ln-relative.patch
>  delete mode 100644 package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
>  delete mode 100644 package/systemd/0004-install-don-t-use-ln-relative.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
