From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:09:23 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: don;
 t register each tools twice
In-Reply-To: <1474561686-22804-1-git-send-email-yann.morin.1998@free.fr>
References: <1474561686-22804-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160923080923.77335af4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 18:28:06 +0200, Yann E. MORIN wrote:
> Because each tool's individual .mk files are included from the top-level
> Makefile and we also include them from linux-tools.mk, they get
> registered twice, and thus built twice, and thus installed twice.
> 
> We did included them from linux-tools.mk to guarantee they would be
> included early and each tool had a chance to register itself before we
> were to construct the build and install hooks.
> 
> However, the ordering is _currently_ guaranteed, in the C locale by the
> files names, which we anyway sort using make's $(sort) function, which
> always sorts in the C locale.
> 
> Beware if we are to ever rename thos files in the future...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/linux-tools/linux-tools.mk | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)

Applied to master after fixing minor typos here and there. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
