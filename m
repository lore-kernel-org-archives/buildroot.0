From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 1 Oct 2013 14:51:00 -0500
Subject: [Buildroot] [PATCH 1/1] python-ipy: new package
In-Reply-To: <524AFB18.1000203@mind.be>
References: <1380318149-22696-1-git-send-email-mlweber1@rockwellcollins.com>
 <524AFB18.1000203@mind.be>
Message-ID: <OFAC85354E.AB2D8986-ON86257BF7.006BD434-86257BF7.006D09FF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 10/01/2013 11:40:56 AM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 10/01/2013 01:36 PM
> Subject: Re: [Buildroot] [PATCH 1/1] python-ipy: new package
> 
> On 09/27/13 23:42, Matt Weber wrote:
[snip]

> > +define PYTHON_IPY_BUILD_CMDS
> > +   (cd $(@D); \
> > +      CC="$(TARGET_CC)" \
> > +      CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
> > +      LDSHARED="$(TARGET_CC) -shared" \
> > +      LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$
> (STAGING_DIR)/usr/lib" \
> 
>   The -I and -L shouldn't be needed - if they are, something else must 
be 
> wrong...
> 
>   I realize the other python packages don't do it, but why not use 
> TARGET_CONFIGURE_OPTS?

Agree, I switched over to that and it works perfectly.
Plus the patch looks much cleaner :-)


[snip]
> 
>   Regards,
>   Arnout
