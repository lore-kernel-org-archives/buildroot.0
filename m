From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 15:17:47 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <20160917125347.GA3613@free.fr>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <20160916190517.01d3dd5a@free-electrons.com>
 <20160916190244.GC3650@free.fr>
 <20160917144233.116fbc8a@free-electrons.com>
 <20160917125347.GA3613@free.fr>
Message-ID: <20160917151747.7a4f75cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 14:53:47 +0200, Yann E. MORIN wrote:

> > I would expect the newly defined Linux configuration to be taken into
> > account, but it's not, it only re-does the fixups and doesn't reload
> > the configuration from mvebu_v7_defconfig.  
> 
> Ah, I did not understand that. Indeed, this use-case is not covered,
> neitehr currently nor with this patch applied.
> 
> However, I wonder how we could detect that condition...

Well, it's not so much about "detecting": it's about
"<pkg>-reconfigure" having the semantic of "I'm doing the entire
configure step again".

> I'll see if we can do something to cover your use-case...

Again, I am not sure at all it is worth trying to cover my use case.

On one side, <pkg>-reconfigure should "reconfigure" the package. But on
the other hand, Buildroot does not guarantee at all that changes done
in menuconfig are taken into account without re-doing a full "make
clean".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
