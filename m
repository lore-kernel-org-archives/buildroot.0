From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 17:40:15 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: create $(BUILD_DIR) before
 attempting to touch .root
In-Reply-To: <1436867048-6333-1-git-send-email-patrickdepinguin@gmail.com>
References: <1436867048-6333-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150714174015.33211eb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 14 Jul 2015 11:44:08 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The target $(BUILD_DIR)/.root does not have a direct dependency on
> $(BUILD_DIR), meaning that cases could exist where the target is executed
> without $(BUILD_DIR) being present.
> Instead of hoping on a specific order, and instead of adding new make
> dependencies, just make sure the directory is created.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Marked as superseded, because the skeleton package from Maxime makes
this no longer needed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
