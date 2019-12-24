From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 24 Dec 2019 14:39:12 +0100
Subject: [Buildroot] [PATCH] package/fontconfig: Fix UUIDD dependency
In-Reply-To: <20191224143623.2cbdcf55@windsurf>
References: <20191224112330.14173-1-michael@amarulasolutions.com>
 <20191224134557.43cadbf2@windsurf>
 <CAOf5uw=cG3nm8mWfVyuauDoTzE6i0XAvQ_K=bocyEdbJmFAV3Q@mail.gmail.com>
 <20191224143623.2cbdcf55@windsurf>
Message-ID: <CAOf5uwmcedGDiFR5mXAT16siS0XTd=mYW8dwR20_y8BwNWAzAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Tue, Dec 24, 2019 at 2:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 24 Dec 2019 13:56:37 +0100
> Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:
>
> > > Indeed, fontconfig does not fail to build in the autobuilders, so I'd
> > > like to understand what is the exact issue, and make sure we are doing
> > > the right fix.
> >
> > Give time to build from clean again. I will send you the log
>
> Could you also share the .config, or even better, a minimal
> configuration that exhibits the issue ?

I created the config in two steps. Now I'm thinking that was only
happen after I have added the XORG
and OPENJDK. I have added this two components without re-build from
scratch. Basically libconfig was looking for uuid and fail
to find in the filesystem. I was thinking looking at the config.in
that the right thing to do is adding
that one instead of LIBUIID. I'm checking now

Michael
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
