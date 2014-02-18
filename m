From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 17:09:04 +0100
Subject: [Buildroot] [PATCH 1/1] crda: fix build failure for nios2
In-Reply-To: <530138C2.7010109@frajasalo.de>
References: <530138C2.7010109@frajasalo.de>
Message-ID: <20140218170904.25df48b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Bergmann,

On Sun, 16 Feb 2014 23:16:34 +0100, Frank Bergmann wrote:
> libgcrypt depends on libgpg-error and this isn't accounted for in
> crda makefile, but it is in libgcrypt-config script (in the correct
> order for linking), so set LDLIBS calling this script not only for
> static linking.
> 
> Fixes http://autobuild.buildroot.org/results/156/15656ef0187b0a8db6c66fc7a7fcb58a99999fa1
> 
> Signed-off-by: Frank Bergmann <frank@frajasalo.de>
> ---
>   package/crda/crda.mk |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Note that the patch didn't apply for me on the latest master. It might
be caused by whitespace damage. Frank, please use "git send-email" to
send your patches the next time, because your e-mail client is doing
funky things with patches that render them unapplicable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
