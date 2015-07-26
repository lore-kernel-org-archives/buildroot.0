From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:21:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: fix undefined
 reference to _authdes_seccreate
In-Reply-To: <1437751142-3532-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437751142-3532-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150726152114.66bb67e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 24 Jul 2015 17:19:02 +0200, J?rg Krause wrote:
> Commit 1c4767fa9d8c19b52824b1c10e0e25f413111f2d disables the C files auth_des.c
> and authdes_prot.c implementing DES authentification but forgets to remove
> a function call to authdes_seccreate() in rpc_soc.c.
> 
> We add a seperate patch to disable the DES authentification (and not disable it
> together with NIS). DES is not provided by uClibc and musl.
> 
> Fixes:
> http://autobuild.buildroot.org/results/33f/33f1849c6d1441d8565835872281e33a980aba6f/
> http://autobuild.buildroot.net/results/02e/02e9321b54d41b4b5c91d93c9942499a20d26919/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...able-parts-of-TIRPC-requiring-NIS-support.patch |  6 +-
>  ...0007-Disable-DES-authentification-support.patch | 75 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 3 deletions(-)
>  create mode 100644 package/libtirpc/0007-Disable-DES-authentification-support.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
