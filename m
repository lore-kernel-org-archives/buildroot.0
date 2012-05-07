From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 May 2012 16:04:06 +0200
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <20120507135519.GE8916@sapphire.tkos.co.il>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
 <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
 <20120507154541.325b298d@skate>
 <20120507135519.GE8916@sapphire.tkos.co.il>
Message-ID: <20120507160406.137b4798@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 7 May 2012 16:55:19 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> > 	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)
> > -D__i386__" -C $(@D) all
> 
> But then you'll have CFLAGS defined twice. Is this OK?

You'll have a first definition of CFLAGS in TARGET_CONFIGURE_OPTS,
overriden by the local redefinition. We do this in numerous places in
Buildroot already.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
