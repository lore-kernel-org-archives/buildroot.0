From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 May 2015 08:00:27 +0300
Subject: [Buildroot] [PATCH] busybox: add option to install ntp startup
 script
In-Reply-To: <CAJ3iQcqvv7mDnGiEzfGUCqXmTAkKmsKWiSH0cQU0PJ_c=rU75w@mail.gmail.com>
References: <1431979101-25367-1-git-send-email-bos@je-eigen-domein.nl>
 <CAJ3iQcrTBMLEU8zeQYFXmP9ugvrLyD4J1aKfcUmUyJhKtOwB5A@mail.gmail.com>
 <CAJ3iQcqvv7mDnGiEzfGUCqXmTAkKmsKWiSH0cQU0PJ_c=rU75w@mail.gmail.com>
Message-ID: <20150519050027.GR2845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Greg,

On Tue, May 19, 2015 at 12:23:21PM +0800, Gergely Imreh wrote:
> >> diff --git a/package/busybox/ntp.conf b/package/busybox/ntp.conf
> >> new file mode 100644
> >> index 0000000..9851d9f
> >> --- /dev/null
> >> +++ b/package/busybox/ntp.conf
> >> @@ -0,0 +1,2 @@
> >> +server 0.pool.ntp.org
> >> +server 1.pool.ntp.org
> >
> > Isn't 2 servers too few in general? If there's a default conf, maybe
> > use the same setup as the NTP Pool project page's simple setup at
> > http://www.pool.ntp.org/en/use.html
> >
> > --- /dev/null
> > +++ b/package/busybox/ntp.conf
> > @@ -0,0 +1,6 @@
> > +driftfile /var/lib/ntp/ntp.drift
> > +
> > +server 0.pool.ntp.org
> > +server 1.pool.ntp.org
> > +server 2.pool.ntp.org
> > +server 3.pool.ntp.org
> 
> Also, after trying a test build, the ntp.conf script from this patch
> is overwritten by package/ntp/ntpd.etc.conf anyways, so would not
> actually show up on the target (I'm assuming that the ntp package is
> selected).

That's the intended behaviour. Whenever you select a package that implements 
the same functionality as a Busybox applet, the selected package takes 
precedence. For this reason any such package should list busybox in its 
<PKG>_DEPENDENCIES. I see that the ntp package doesn't do so, but I think it's 
a bug. I'll send a patch shortly.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
