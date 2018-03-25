From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:53:13 +0200
Subject: [Buildroot] [PATCH v4 9/9] core: kill DEPENDENCIES_HOST_PREREQ
In-Reply-To: <20180324142008.10375-10-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:08 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-10-thomas.petazzoni@bootlin.com>
Message-ID: <87y3igup7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Now that DEPENDENCIES_HOST_PREREQ is no longer used anywhere, we can
 > kill it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes since v3:
 >  - Added Acked-by from Yann.

 > Changes since v2:
 >  - New patch
 > ---
 >  Makefile                             |  2 --
 >  package/pkg-generic.mk               |  2 --
 >  support/dependencies/dependencies.mk | 10 ++--------
 >  3 files changed, 2 insertions(+), 12 deletions(-)

 > diff --git a/Makefile b/Makefile
 > index 925d6e4aec..a3a9d290d9 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -501,8 +501,6 @@ include package/Makefile.in
 >  -include $(sort $(wildcard arch/arch.mk.*))
 >  include support/dependencies/dependencies.mk
 
 > -PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
 > -
 >  include $(sort $(wildcard toolchain/*.mk))
 >  include $(sort $(wildcard toolchain/*/*.mk))
 
 > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 > index 6d1f267328..6d82f7027e 100644
 > --- a/package/pkg-generic.mk
 > +++ b/package/pkg-generic.mk
 > @@ -690,9 +690,7 @@ $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
 >  $$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
 
 >  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
 > -ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
 >  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
 > -endif

These two lines can now be simplified, but that can be done later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
