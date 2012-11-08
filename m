From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 08 Nov 2012 13:35:55 +0100 (CET)
Subject: [Buildroot] problem building a SDL app with buildroot
In-Reply-To: <CAHXCMMJjaafke3POAv04fdK80L_DWguu+UdbDrah9HSYPfwf-g@mail.gmail.com>
Message-ID: <2db9ad2e-1d60-4dbc-8ab7-7c9ecf44c57e@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > OUTPUT_VARIABLE SDL_CFLAGS)
> 
> As a quick fix, in your app *.mk file, you can try to add:
> <your app prefix>_CONF_OPT +=
> -DSDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
> 

yup, I did that and it did fix my problem, thx... now i'm looking into some gettext problems, but that will be a seaparate email :)

> You don't have to change anything in the sdl-config from the staging
> area, it is already handled by the sdl package.
> 
> 
> BTW, that an issue we are aware of, and we talked a bit about it
> during the last Buildroot Dev Days.
> We just need some time to work on and figure out the best way to fix
> this.
> 
> 


fair enough, I wanted to make sure I didn't miss something obvious... the fix above is good enough for me until there is an official way of doing it

Regards
Jeremy


> Regards,
> 
> --
> Sam
> 
