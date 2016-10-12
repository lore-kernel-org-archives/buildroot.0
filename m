From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 12 Oct 2016 14:02:36 +0200
Subject: [Buildroot] [PATCH] package/shairport-sync: bump to version
 2.8.5
In-Reply-To: <20161012135745.353243f9@free-electrons.com>
References: <20161011200732.29826-1-joerg.krause@embedded.rocks>
 <20161012135745.353243f9@free-electrons.com>
Message-ID: <1476273756.1492.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mi, 2016-10-12 at 13:57 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 11 Oct 2016 22:07:32 +0200, J?rg Krause wrote:
> 
> > 
> > ?SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
> > @@ -17,7 +17,8 @@ SHAIRPORT_SYNC_AUTORECONF = YES
> > ?SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
> > ?	--with-metadata \
> > ?	--with-pipe \
> > -	--with-stdout
> > +	--with-stdout \
> > +	--sysconfdir=/etc
> 
> We are already passing --sysconfdir=/etc globally to all autoconf
> based
> packages, in package/pkg-autotools.mk, so this should not be
> necessary.

I see!

> Do you really see things installed in /usr/local/etc ? Why isn't the
> global --sysconfdir passed by pkg-autotools.mk not working ?

To be honest, I only checked that passing sysconfdir locally is working
as I didn't know that it is passed globally. So I will remove this
setting in v2.

Thanks!

Best regards
J?rg Krause
