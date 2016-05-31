From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 31 May 2016 23:02:51 +0200
Subject: [Buildroot] [PATCH v2] package/net-tools: fix static linking
	issue with lintl
In-Reply-To: <87d1o2zdkn.fsf@dell.be.48ers.dk>
References: <1464462121-24585-1-git-send-email-romain.naour@gmail.com>
 <87d1o2zdkn.fsf@dell.be.48ers.dk>
Message-ID: <83935091-e0a0-0259-78c9-89e65c9cdbb7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> 
>> @@ -37,7 +35,9 @@ NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
>  
>  >  define NET_TOOLS_BUILD_CMDS
>  >  	$(TARGET_MAKE_ENV) AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
>  > -		LDFLAGS="$(NET_TOOLS_LDFLAGS)" $(MAKE) -C $(@D)
>  > +		LDFLAGS="$(TARGET_LDFLAGS)" \
>  > +		LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)" \
>  > +		$(MAKE) -C $(@D)
> 
> Seperate from this patch, but can't we use TARGET_CONFIGURE_OPTS here
> instead of passing AR/CC/LDFLAGS separately?
> 

Yes, you're right.

Using TARGET_CONFIGURE_OPTS allow to remove TARGET_MAKE_ENV since it also brings
PATH=$(BR_PATH).

I'll send a patch.

Best regards,
Romain
