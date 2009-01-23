From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 23 Jan 2009 19:17:32 -0200
Subject: [Buildroot] How handle broken or partly broken packages in the
	distribution
In-Reply-To: <1232732815.5311.88.camel@elrond.atmel.com>
References: <1232651253.5311.19.camel@elrond.atmel.com>
	<20090123095712.6878553d@hcegtvedt>
	<d6cda7730901230912g6851880fua908aad10de0192@mail.gmail.com>
	<1232732815.5311.88.camel@elrond.atmel.com>
Message-ID: <d6cda7730901231317q57e351dev9ef8b5f1dc24086f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 23, 2009 at 3:46 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
>
> Why on earth do you want to enable a thing which NEVER will work?
>
> If you want to update the package so it works,
> then you can do that in the trunk which should not
> have these limitations turned on by default

As I said, just remove the package from defconfig.
If we start disabling stuff just because of some minor build problem,
the chances that it will be fixed and enabled again are slim. How do
you differentiate things that are just minor corrections from things
that doesn't make sense at all to be enabled in that platform?

We would of course want to disable PCI Utils in AVR32 since there is
no PCI bus there. But not linux-fusion stuff that doesn't build right
now but it did a while back.

Usually a release is a trunk revision at some point. Going thru
several packages disabling them just for releases isn't much
practical.

> The distibution, on the other hand, should be easy to use
> and should IMO protect users against wasting their time.

They can read the help message for that. A common pattern for users is
to build the default config first, and that we should make sure to
have working.


Kind Regards,
    Thiago A. Correa
