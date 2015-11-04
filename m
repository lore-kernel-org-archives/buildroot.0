From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 14:20:12 +0100
Subject: [Buildroot] [PATCH 1/2 v2] core/pkg-generic: allow step hooks
 to fail a step
In-Reply-To: <074ea9eec180d35931daa3a130d21f47dec4e267.1446577223.git.yann.morin.1998@free.fr>
References: <cover.1446577223.git.yann.morin.1998@free.fr>
 <074ea9eec180d35931daa3a130d21f47dec4e267.1446577223.git.yann.morin.1998@free.fr>
Message-ID: <20151104142012.35bc55ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  3 Nov 2015 20:06:03 +0100, Yann E. MORIN wrote:
> Currently, we touch our stamp files before we call the step hooks.
> This means a step hook can not properly fail a step, since the stamp
> file exists even if the hook exits in error, thus a subsequent 'make'
> would not try to redo that step.
> 
> Fix that by calling the hooks before we touch the stamp files.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/pkg-generic.mk | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
