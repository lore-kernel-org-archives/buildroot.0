From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:51:50 +0200
Subject: [Buildroot] [PATCH] package infra: remove duplicates in
 dependencies list
In-Reply-To: <1401618534-16200-1-git-send-email-yann.morin.1998@free.fr>
References: <1401618534-16200-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140608185150.672316f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  1 Jun 2014 12:28:54 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, we just use what a package declares as its dependencies.
> 
> But some packages may declare the same depdency more than once. For
> example, php has two options to add SQL support: 'mysql' or 'mysqli',
> which are not exclusive. So, php.mk has mysql twice as a dependency.
> 
> Although that does not cause any grievance for make, we end up generating
> dependency graphs where this duplicate dependency is visible.
> 
> Add an intermediary variable which contains the $(sort)-ed list of the
> dependnecies, thus eliminating any duplicates.
> 
> This has the side effect of also sorting the list, which is probably
> good for reproducibility anyway.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
