From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Sep 2015 14:35:53 +0300
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <20150920131647.7ab94a04@free-electrons.com>
References: <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
 <20150917162003.GT11632@tarshish>
 <alpine.DEB.2.02.1509171922410.13941@orcam81.orcam.lan>
 <20150917192315.6db18115@free-electrons.com>
 <20150917190424.GU11632@tarshish>
 <20150917221546.247fe210@free-electrons.com>
 <alpine.DEB.2.11.1509192310350.1987@tanhuma.tkos.co.il>
 <20150920102240.6e8db4f5@free-electrons.com>
 <55FE8CE3.4030402@mind.be>
 <20150920131647.7ab94a04@free-electrons.com>
Message-ID: <20150920113553.GH2782@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 20, 2015 at 01:16:47PM +0200, Thomas Petazzoni wrote:
> On Sun, 20 Sep 2015 12:39:31 +0200, Arnout Vandecappelle wrote:
> > > There's some logic in the skeleton package that guarantees that /bin/sh
> > > points to the system shell selected by the user in his configuration.
> > > So forcing /bin/sh as the shebang should be fine.
> > 
> >  Well, if the scripts indeed require Bourne extensions, then possibly ash and
> > dash will not work... And I have no idea about zsh either.
> 
> I think Baruch said he had tried, and the script were working fine with
> the Busybox shell.

I only tried zgrep. But as I said, all these scripts look pretty trivial, and 
I can't find any mention of shell dependencies in gzip sources. On Debian all 
of these scrips use the /bin/sh shebang, and AFAIK Debian does not guarantee 
/bin/sh to point to bash. I think we can safely assume that any POSIX-like 
shell will work.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
