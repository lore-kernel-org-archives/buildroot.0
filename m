From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 May 2014 09:21:14 +0200
Subject: [Buildroot] [PATCH] nodejs: fix build when python3 is selected
 in Buildroot
In-Reply-To: <20140521025243.GI27238@tarshish>
References: <1400617814-21757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140521025243.GI27238@tarshish>
Message-ID: <20140521092114.7f8caeb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 21 May 2014 05:52:43 +0300, Baruch Siach wrote:

> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index b5973b5..7415bdf 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -35,8 +35,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
> >  		--without-dtrace \
> >  		--without-etw \
> >  	)
> > -	$(SED) "s@'python',@'$(HOST_DIR)/usr/bin/python2',@" \
> > -		$(@D)/deps/v8/tools/gyp/v8.gyp
> 
> The comment above 'define HOST_NODEJS_CONFIGURE_CMDS' should be updated to 
> match.

Ah, right, indeed. Will send a v2.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
