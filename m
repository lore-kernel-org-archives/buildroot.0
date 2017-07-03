From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 18:04:14 +0200
Subject: [Buildroot] [PATCH 3/5] core/pkg-util: pass package directory
	and name when saving license files
In-Reply-To: <bb071b1f0de2d95a115d4027b61c085f2d4257d9.1498428166.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 26 Jun 2017 00:03:39 +0200")
References: <cover.1498428166.git.yann.morin.1998@free.fr>
 <bb071b1f0de2d95a115d4027b61c085f2d4257d9.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <87k23p7bi9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This will be usefull when checking the hashes of the license files.
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
 > ---
 >  Makefile               | 2 +-
 >  package/pkg-generic.mk | 2 +-
 >  package/pkg-utils.mk   | 6 +++---
 >  3 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/Makefile b/Makefile
 > index 88d98e0405..1c272d009c 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -740,7 +740,7 @@ legal-info-clean:
 >  .PHONY: legal-info-prepare
 >  legal-info-prepare: $(LEGAL_INFO_DIR)
 >  	@$(call MESSAGE,"Collecting legal info")
 > -	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
 > +	@$(call legal-license-file,buildroot,buildroot,,COPYING,COPYING,HOST)

I believe the third argument should be '.' (or some subdirectory if we
want to hide the file) as check-hash is called with $(3)/$(1).hash

So I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
