From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 13:58:39 +0100
Subject: [Buildroot] [PATCH] coreutils: fix libintl, reorder ENV,
 OPTS & PROGS
In-Reply-To: <1414326790-26103-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414326790-26103-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141026135839.71d17069@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 26 Oct 2014 09:33:10 -0300, Gustavo Zacarias wrote:
> Move OPTS, ENV & PROGS up to the top, the fact that a conditional
> (BR2_PACKAGE_BUSYBOX) was before them is bad style and confused me while
> i tried to get them grouped together.
> This was making all of the new disable OPTS fail, pretty much harmless
> but still.
> 
> Account for libintl/gettext presence, it's not required in any toolchain
> combination but it will fail if it's present, so use it when it's
> selected by some other package. Fixes:
> http://autobuild.buildroot.net/results/30d/30d0e3d27d8606443479466e60716e6f202a4711/
> 
> Add conditional on OpenSSL for faster hashing binaries as pointed again
> by P?draig Brady.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/coreutils/coreutils.mk | 94 +++++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 42 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
