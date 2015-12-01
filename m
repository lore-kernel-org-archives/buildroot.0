From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:46:50 +0100
Subject: [Buildroot] [PATCH] cryptodev-linux: bump to version 1.8
In-Reply-To: <1448977966-15980-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448977966-15980-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151201174650.358ed096@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Peter,

On Tue,  1 Dec 2015 10:52:46 -0300, Gustavo Zacarias wrote:
> Patches are upstream so remove them.

Woohoo, I like when we can get rid of patches because they have been
upstreamed.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-fix-compilation-against-linux-3.19.patch  | 37 ----------------
>  .../0002-Fix-compilation-against-linux-4.3.patch   | 50 ----------------------
>  package/cryptodev-linux/cryptodev-linux.hash       |  2 +-
>  package/cryptodev-linux/cryptodev-linux.mk         |  2 +-
>  4 files changed, 2 insertions(+), 89 deletions(-)
>  delete mode 100644 package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
>  delete mode 100644 package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch

Applied to next (soon to be master).

Peter: this might create a conflict when merging back to master. The
0002-Fix-compilation-against-linux-4.3.patch that Gustavo is removing
here has never been added to next, it had only been added to master. So
when I applied this commit to the next branch, it just discarded the
information that this commit removes
0002-Fix-compilation-against-linux-4.3.patch.

However, when you merge next into master, please make sure to re-remove
0002-Fix-compilation-against-linux-4.3.patch. Otherwise, it will fail
to apply after extracting the new version of cryptodev-linux.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
