From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 21:14:41 +0100
Subject: [Buildroot] [PATCH 3/3] package/gcc: align gcc-final
 configure-cmds to the generic ones
In-Reply-To: <4d9f7a6896c496372a4f415987e60eeeac79225b.1448202976.git.yann.morin.1998@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <4d9f7a6896c496372a4f415987e60eeeac79225b.1448202976.git.yann.morin.1998@free.fr>
Message-ID: <20151123211441.5135a9d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 22 Nov 2015 15:39:43 +0100, Yann E. MORIN wrote:
> Since 7d6c79 (Compile static versions of gcc libraries) was applied, the
> generic configure commands have been updated, but those changes have not
> been propagated to the gcc-final custom configure commands.
> 
> Update the gcc-final custom configure commands to better match the
> generic ones.
> 
> We do not propagate --disable-dependency-tracking because it breaks the
> build, and --enable-shared (because of 169141a).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

A little bit like Arnout, I am not sure to see the value of fully
aligning the configure commands just for the sake of it.

Another possibility is to add a mechanism in the infra to exclude some
generic config options from being used. But I tend to hate package
infrastructure that are needed only for one package, especially when
there is a way of not changing the infrastructure (which is the case
here).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
