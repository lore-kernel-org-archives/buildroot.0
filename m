From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 17:59:57 +0100
Subject: [Buildroot] [PATCH v2 1/1] ngrep: fix static linking issue with
 libpcre
In-Reply-To: <5255D08E.3000307@openwide.fr>
References: <5255D08E.3000307@openwide.fr>
Message-ID: <20131101175957.689162a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 09 Oct 2013 23:54:22 +0200, Romain Naour wrote:
> 
> Adding -lpcre in LDFLAGS place the library before object files:
> gcc ... -lpcre -L .../sysroot/usr/lib -s -o ngrep ngrep.o -lpcap
> 
> Makefile.in is patched to use @LIBS@ for adding -lpcre in the right place.
> 
> Fixes:
> http://autobuild.buildroot.net/results/684/684a3bed28d13ef5e5156257aade3b9aff32f180
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Thanks, but this patch no longer applies on top of master, and more
importantly, the ngrep-1.45-Makefile.in.patch doesn't apply to the
ngrep sources. Could you rename the ngrep patches to use numbers, i.e
ngrep-01-<foo>.patch, and use a more descriptive name than
ngrep-1.45-Makefile.in.patch?

(Should be done in two patches: one renaming the existing patches, one
adding the pcre static link fix).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
