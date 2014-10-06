From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 21:00:10 +0200
Subject: [Buildroot] [PATCH] legal-info: fix bug leading to one package
 not being considered
In-Reply-To: <1412612170-31047-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412612170-31047-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141006210010.3eb99ed6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Oct 2014 18:16:10 +0200, Thomas Petazzoni wrote:
> Due to excessive parenthesis, the TARGETS_LEGAL_INFO expression was
> evaluated to something like this:
> 
>   toolchain-legal-info toolchain-external-legal-info busybox-legal-info zlib-legal-info))
> 
> Yes, with the last two parenthesis. This had the effect that the
> zlib-legal-info rule was never called: the last package of $(TARGETS)
> $(TARGET_HOST_DEPS) $(HOST_DEPS) was never added in the legal-info
> information.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
