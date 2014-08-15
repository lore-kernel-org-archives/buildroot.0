From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:31:43 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: disable link time optimization
In-Reply-To: <1407875307-12036-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1407875307-12036-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140815223143.72de054d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 12 Aug 2014 22:28:27 +0200, Eric Le Bihan wrote:
> As reported in https://bugs.busybox.net/show_bug.cgi?id=7286,
> systemd fails to build with BR2_OPTIMIZE_2=y. This mode activates the GCC
> options -flto and -ffat-lto-objects, which do not mix well with the GCC
> tricks used in src/compat-libs/linkwarning.h to build the compatibility
> libraries.
> 
> As a temporary workaround, this patch disables link time optimization for
> systemd.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/systemd.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
