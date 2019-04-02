From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 3 Apr 2019 01:19:03 +0300
Subject: [Buildroot] [PATCH 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <20190402212338.tjnjkvfftjypaa7c@vkochan-ThinkPad-T470p>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-4-vadim4j@gmail.com>
 <20190327195409.14931f34@windsurf>
 <20190402212338.tjnjkvfftjypaa7c@vkochan-ThinkPad-T470p>
Message-ID: <20190402221903.4pshl3ci6ajgnj66@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[SNIP]

> > > diff --git a/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch b/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
> > > new file mode 100644
> > > index 0000000000..baf1706bb3
> > > --- /dev/null
> > > +++ b/package/s6-rc/0001-configure-Allow-to-specify-compiled-base-dir.patch
> > > @@ -0,0 +1,76 @@
> > > +From cb89562fcec582bbb5bc9a3bf5faf33338e6b535 Mon Sep 17 00:00:00 2001
> > > +From: Vadim Kochan <vadim4j@gmail.com>
> > > +Date: Wed, 13 Feb 2019 03:36:03 +0200
> > > +Subject: [PATCH] configure: Allow to specify compiled base dir
> > > +
> > > +It allows to specify different s6-rc compiled dir (for example
> > > +/etc/s6/rc/compiled), without specifying it as command line argument
> > > +for s6-rc* tools.
> > > +
> > > +Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > 
> > Has this patch been submitted upstream ? What does they say about it ?
> > Why can't we use the command line argument and avoid the patch ?
> 
> Without this patch then it needs to manually type this path /etc/s6/rc/compiled,
> in case if to run s6-rc from command-line.

Sorry, this is not a good explanation. By default s6-linux-init is
installed to /etc/s6-init and s6-rc into /etc/s6-rc, but I decided to
put them together into /etc/s6, thats why it needs patch which allows to
define new default db's base dir in /etc/s6.
 
Regards,
Vadim Kochan
