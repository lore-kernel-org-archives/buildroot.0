From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 12 Mar 2013 05:30:01 -0300
Subject: [Buildroot] [RFC/PATCH] fs/common.mk: Fix wrong double dollar
	usage
In-Reply-To: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <20130312083000.GA2506@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 09, 2013 at 06:04:12PM -0300, Ezequiel Garcia wrote:
> Double dollar sign is used to put an explicit dollar sign,
> for instance, when writing a makefile rule.
> 
> In this case, there are some makefile conditionals where
> makefile variables are evaluated using double dollar signs
> instead of single dollar, which is wrong.
> 
> In particular, this fixes a buildroot 'make' stall
> when building with an empty device table (empty BR2_ROOTFS_DEVICE_TABLE).
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> I'm sending this as RFC because I'm new to buildroot
> and because I'm not a makefile wizard.
> AFAIK, this fixes a real bug in my compilation,
> as explained in the commit message.
> 
>  fs/common.mk |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 

Any comments? How does this look like?

-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
