From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 23:16:46 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: drop redundant shell call
 when deriving BASE_DIR
In-Reply-To: <1479868291-2863-1-git-send-email-danomimanchego123@gmail.com>
References: <1479868291-2863-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20161127231646.4d998029@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 21:31:31 -0500, Danomi Manchego wrote:
> Commit 173135df5b69dfd5ae6fe6cf2de8833c6f74c143 ("core: re-enter make if
> $(CURDIR) or $(O) are not canonical paths") introduced the CANONICAL_O
> variable, defined as:
> 
> CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
> 
> This duplicates the definition of BASE_DIR, by different means:
> 
> BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
> 
> So one of these shell calls is redundant. CANONICAL_O is defined first,
> so this commit replaces the BASE_DIR derivation with $(CANONICAL_O).
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
