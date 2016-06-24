From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 16:02:59 +0200
Subject: [Buildroot] [PATCH 06/13 v7] core/apply-patches: store full
 path of applied patches
In-Reply-To: <c559a7f8e88eb7fc763f9122d317c98b889cd5c4.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <c559a7f8e88eb7fc763f9122d317c98b889cd5c4.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160624160259.15381a6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:31 +0200, Yann E. MORIN wrote:
> Currently, we only store the filename of the applied patches.
> 
> However, we are soon to want to install those patches in the legal-info
> directory, so we'll have to know where those patches come from.
> 
> Instead of duplicating the logic to find the patches (bundled,
> downloaded, from a global patch dir...), just store the full path to
> each of those patches so we can retrieve them more easily later on.
> 
> Also always create the list-file, even if empty, so that we need not
> test for its existence before reading it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> [Tested only with patches in the Buildroot sources]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v1 -> v2:
>   - do not duplicate '/' in paths  (Luca)
> ---
>  support/scripts/apply-patches.sh | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

I've changed $(pwd) to $PWD, as suggested by Arnout, and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
