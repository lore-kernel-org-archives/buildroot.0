From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Mon, 26 Aug 2013 16:04:39 +0200 (CEST)
Subject: [Buildroot] libffi target header installation problem
In-Reply-To: <20130826154420.72868235@skate>
Message-ID: <277645944.5505869.1377525879032.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well I had, for a specific reason, two folder for two different versions of libffi into $(STAGING_DIR)/usr/lib/:
libffi-3.0.11 and libffi-3.0.10 
This mv command was failing saying:
"will not overwrite just-created <filename> with <sameFilename>"
because it was trying to overwrite the .h it just moved. 

And I think we should be sure that we move the header related with the actual package described into libffi.mk

Does it make sense ?

Thanks a lot,
Nicolas.

----- Mail original -----
> De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> ?: "Nicolas M?n?gale" <nicolas.menegale@openwide.fr>
> Cc: buildroot at busybox.net
> Envoy?: Lundi 26 Ao?t 2013 15:44:20
> Objet: Re: [Buildroot] libffi target header installation problem
> 
> Dear Nicolas M?n?gale,
> 
> On Mon, 26 Aug 2013 15:41:51 +0200 (CEST), Nicolas M?n?gale wrote:
> > Hi Everyone,
> > 
> > In libffi.mk:23:
> > mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h
> > $(STAGING_DIR)/usr/include/
> > 
> > Wouldn't it make more sense this way ?
> > mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h
> > $(STAGING_DIR)/usr/include/
> > 
> > Same thing for the LIBFFI_MOVE_TARGET_HEADERS hook below this line.
> > 
> > If so I can send a patch to correct that.
> 
> What "problem" are you seeing with the current code?
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 
