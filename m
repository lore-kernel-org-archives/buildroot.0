From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:50:01 +0200
Subject: [Buildroot] [PATCH 04/20] package/skeleton: make
 SKELETON_LIB_SYMLINK a macro
In-Reply-To: <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170722155001.533d6aec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:25:30 +0200, Yann E. MORIN wrote:
> Rather than duplicate that code in all skeleton packages, make this a
> macro, so that it is easier to use.

Is it really going to be used in *all* skeleton packages ? Because if
it is, it means it's the exact same call that will be duplicated
everywhere, which would mean it should be factored out.

But in practice, it seems it's not used in all skeleton packages, but
just in skeleton-common.mk and skeleton-custom.mk, correct ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
