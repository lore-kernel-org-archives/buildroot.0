From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue, 9 Apr 2019 07:11:30 +0000
Subject: [Buildroot] [PATCH] gettext-tiny: Make libiconv only target
 dependency
In-Reply-To: <20190409063943.2uac4za2nt445j5a@vkochan-ThinkPad-T470p>
References: <20190408140442.29566-1-abrodkin@synopsys.com>
 <20190408230530.0a8a67be@windsurf.home>
 <20190408215410.e3mxykdxrm23y3ml@vkochan-ThinkPad-T470p>
 <20190409080207.0bc7649b@windsurf.home>
 <20190409063943.2uac4za2nt445j5a@vkochan-ThinkPad-T470p>
Message-ID: <CY4PR1201MB0120220BE600F82BE6353807A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim,

> -----Original Message-----
> From: Vadim Kochan <vadim4j@gmail.com>
> Sent: Tuesday, April 9, 2019 9:40 AM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>; buildroot at busybox.net; ARC Buildroot mailing list
> <arc-buildroot@synopsys.com>
> Subject: Re: [Buildroot] [PATCH] gettext-tiny: Make libiconv only target dependency
> 
> Hi Thomas, Alexey, All
> 
> On Tue, Apr 09, 2019 at 08:02:07AM +0200, Thomas Petazzoni wrote:
> > On Tue, 9 Apr 2019 00:54:10 +0300
> > Vadim Kochan <vadim4j@gmail.com> wrote:
> >
> > > libiconv is needed by msgfmt and msgmerge during "translation" on the
> > > host so I think host-gettext-tiny should depend on host-libiconv.
> >
> > There is no such thing as "host-libiconv". We do not need it, because
> > we assume the host system is iconv-capable.
> >
> > The only thing gettext-tiny does for the target is install the wrapper
> > gettext program, so it certainly does not need libiconv.
> >
> > The right fix is to remove this conditional libiconv dependency
> > entirely, and probably we should do the same for the gettext-gnu
> > package.
> >
> 
> Thanks for the explanation!

Are you going to prepare a fix mentioned by Thomas or should I do it myself?

-Alexey
