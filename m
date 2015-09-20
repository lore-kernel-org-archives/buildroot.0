From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Sep 2015 20:16:52 +0300
Subject: [Buildroot] [PATCH] make: requires dynamic libraries
In-Reply-To: <20150920190408.48d568c0@free-electrons.com>
References: <1442450292-13794-1-git-send-email-ryanbarnett3@gmail.com>
 <20150917232742.6b253d01@free-electrons.com>
 <CALq67GCCHMGowurww4w=W7wpAzCDUJHnFLhMDnDo1_33SGNnbQ@mail.gmail.com>
 <20150920185821.53cb363b@free-electrons.com>
 <20150920190408.48d568c0@free-electrons.com>
Message-ID: <20150920171652.GI2782@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 20, 2015 at 07:04:08PM +0200, Thomas Petazzoni wrote:
> On Sun, 20 Sep 2015 18:58:21 +0200, Thomas Petazzoni wrote:
> 
> > On Sun, 20 Sep 2015 09:40:25 -0500, Ryan Barnett wrote:
> > 
> > > I am going to go disabling guile support in a static only
> > > configuration. I ran into an issue with setting GC_NO_DLOPEN define in
> > > that there then becomes multiple definitions of locale_charset between
> > > libintl and libguile and I wasn't sure how to properly fix it. Looking
> > > at what guile is used for in make, it doesn't appear extremely useful
> > > especially in a static only configuration.
> > 
> > I think we should disable guile support completely, not only for static
> > only builds. I don't really see the usefulness of guile support in
> > make in the context of Buildroot.
> 
> I didn't see that there is some explicit handling of guile in our
> current make package. It was added by Baruch in commit
> 38ee8a8e1651f1de2b2698e4c6bce2e488001cdb.
> 
> Baruch, were you specifically interested in guile support in make?

No. It was just the usual optional dependency for the sake of reproducibility 
as part of a related build failure investigation. I'm fine with removing guile 
support in make.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
