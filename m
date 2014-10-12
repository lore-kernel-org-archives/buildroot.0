From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 19:19:46 +0200
Subject: [Buildroot] [PATCH 07/30] package/qemu: add option to
	enable/disable the VNC frontend
In-Reply-To: <c6dd8b966482249f72c956413b15125f817f93d6.1412719495.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Oct 2014 00:38:16 +0200")
References: <cover.1412719495.git.yann.morin.1998@free.fr>
 <c6dd8b966482249f72c956413b15125f817f93d6.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <87siittdcd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/qemu/Config.in |  7 +++++++
 >  package/qemu/qemu.mk   | 11 ++++++++++-
 >  2 files changed, 17 insertions(+), 1 deletion(-)

 > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
 > index f81b6ca..1c359e4 100644
 > --- a/package/qemu/Config.in
 > +++ b/package/qemu/Config.in
 > @@ -70,6 +70,13 @@ if QEMU_HAS_EMULS
 
 >  comment "Frontends"
 
 > +config BR2_PACKAGE_QEMU_VNC
 > +	bool "Enable VNC frontend"
 > +	select BR2_PACKAGE_VNC

what is BR2_PACKAGE_VNC?

 > +++ b/package/qemu/qemu.mk
 > @@ -116,6 +116,12 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 >  QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_QEMU_VNC),y)
 > +QEMU_OPTS += --enable-vnc
 > +else

And why doesn't it get added to QEMU_DEPENDENCIES?

-- 
Bye, Peter Korsgaard
