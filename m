From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:14:24 +0200
Subject: [Buildroot] [PATCH] core/download: fix source check for git
 method
In-Reply-To: <20170512155429.26176-1-yann.morin.1998@free.fr>
References: <20170512155429.26176-1-yann.morin.1998@free.fr>
Message-ID: <20170513151424.65382928@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 17:54:29 +0200, Yann E. MORIN wrote:
> Running foo-source-check on packages retrieved from git fails.
> 
> This is because there is no associated stamp file, so we do not have a
> rule-assignment that sets PKG for foo-source-check.
> 
> But it does not make sense to have a stamp file at all, because
> source-check is not supposed to change anything: the status after is
> exactly the same as before; nothing is downlaoded, so there is no
> progress (whatsoever) to memorise.
> 
> Fix that by just defining PKG in the source-check rule definition.
> 
> Fixes #9796.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
