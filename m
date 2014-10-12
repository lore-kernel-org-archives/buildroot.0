From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 11:45:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <CA+TH9V=5MVzboiyLDxuuJwXJ=v-t9eZ-8kPF0q=AhXtDsS-1Rg@mail.gmail.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
 <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
 <20141012102554.39aa340a@free-electrons.com>
 <CA+TH9VmaCh+6X7CQVWPctUQTz1mLZyrXB1FyAObNceO_9=BeWQ@mail.gmail.com>
 <20141012110213.5b7c6c8a@free-electrons.com>
 <CA+TH9V=5MVzboiyLDxuuJwXJ=v-t9eZ-8kPF0q=AhXtDsS-1Rg@mail.gmail.com>
Message-ID: <20141012114519.30aa9822@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sun, 12 Oct 2014 11:21:20 +0200, Angelo Compagnucci wrote:

> > Then, the conditional shouldn't be here, but around the dependency of
> > mono on host-mono.
> >
> > That being said, I would recommend you to keep things simple for now,
> > and handle only this use case as a follow-up contribution.
> 
> It is already:
> 
> ifneq ($(MONO_ASSEMBLY_INCLUDED),)
> define MONO_INSTALL_LIBS
> rsync -av --exclude=*.so --exclude=*.mdb --exclude=[0-9].[0-9] \
> $(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
> rsync -av --exclude=*.so --exclude=*.mdb $(MONO_ASSEMBLY_INCLUDED) \
> $(TARGET_DIR)/usr/lib/mono/
> endef
> MONO_DEPENDENCIES += host-mono
> MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
> endif
> 
> This way the dependency is met only when MONO_ASSEMBLY_INCLUDED.
> By the way, I'll remove this logic, make 4.5 as default version and if
> nothing selected, I'll default evenly on 4.5.

Ok, right. Then don't add a condition around the host-autotools-package
call, this is useless.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
