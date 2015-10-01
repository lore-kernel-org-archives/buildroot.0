From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Oct 2015 08:19:17 +0200
Subject: [Buildroot] [PATCH 1/9] core: sort packages and eliminate
 duplicates before building
In-Reply-To: <ef61b62e70416103f69b2e8c214b7f6bedd99b5e.1443650034.git.yann.morin.1998@free.fr>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
 <ef61b62e70416103f69b2e8c214b7f6bedd99b5e.1443650034.git.yann.morin.1998@free.fr>
Message-ID: <20151001081917.7957b83b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, 30 Sep 2015 23:54:44 +0200, Yann E. MORIN wrote:
> Currently, enabling more than one filesystem image will make
> 'show-targets' list a few host packages more than once.
> 
> This is because all filesystem images add the same set of
> host-packages to their dependencies, which are then added as-is
> to the package list.
> 
> Thus, host-fakeroot, host-makedevs and, if needed, host-mkpasswd will
> appear as many times as there are filesystem images enabled.

Is this a problem? I don't think "show-targets" aims at guaranteeing
that each target will only be listed once.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
