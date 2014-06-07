From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 10:57:28 +0200
Subject: [Buildroot] [PATCH 5 of 7 v3] toolchain-external: change
 version from 'undefined' to 'virtual'
In-Reply-To: <640c5d9c5ac14d442207.1402085581@localhost>
References: <patchbomb.1402085576@localhost>
 <640c5d9c5ac14d442207.1402085581@localhost>
Message-ID: <20140607105728.469dd87d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 06 Jun 2014 22:13:01 +0200, Thomas De Schampheleire wrote:
> The toolchain-external package displays the version 'undefined' in the build
> messages and the directory in output/build, which is not very nice.
> This patch sets the version to 'virtual', in analogy to the toolchain and
> toolchain-buildroot packages (which use the virtual-package infrastructure).
> 
> Although toolchain-external is not strictly a virtual package, since it uses
> the generic-package infrastructure, it can be considered as a virtual
> package in the sense that it does not have a fixed version or source (they
> depend on the selected external toolchain).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I'm sorry, but I continue to disagree. toolchain-external is definitely
*not* a virtual package. I've started using the
TOOLCHAIN_EXTERNAL_VERSION field for musl external toolchains, and I
will send a patch that use it for other toolchains as well.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
