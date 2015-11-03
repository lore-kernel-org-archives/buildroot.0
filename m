From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 21:17:25 +0100
Subject: [Buildroot] [PATCH 1/1] boost: add option to build
 boost_coroutine
In-Reply-To: <1446569978-10357-1-git-send-email-edson.siqueira@datacom.ind.br>
References: <1446569978-10357-1-git-send-email-edson.siqueira@datacom.ind.br>
Message-ID: <20151103211725.48756c35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Edson Siqueira,

On Tue,  3 Nov 2015 14:59:38 -0200, Edson Siqueira wrote:
> It was disabled by default by commit 611dfe6cb55ed72d7df3b7c102f4a723248a4037
> due to the upgrade to boost 1.54.0.
> 
> Signed-off-by: Edson Siqueira <edson.siqueira@datacom.ind.br>
> ---
>  package/boost/Config.in | 4 ++++
>  package/boost/boost.mk  | 4 +---
>  2 files changed, 5 insertions(+), 3 deletions(-)

Thanks, I've applied after doing a bit of research, and tweaking the
commit log as follows:

    boost: add option to build boost_coroutine
    
    It was disabled by default by commit
    611dfe6cb55ed72d7df3b7c102f4a723248a4037 because it caused some build
    failures on AArch64 and SuperH. However, the coroutine module needs
    the context module, which is only available on certain architectures.
    
    We can therefore allow enabling the coroutine module, but only if the
    context module is available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
