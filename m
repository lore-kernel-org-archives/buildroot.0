From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 14 May 2018 08:21:16 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset
 variable in init script
In-Reply-To: <20180514085706.086830e9@windsurf.home>
References: <20180413162521.7078-1-casantos@datacom.ind.br>
 <20180414180725.4964d59d@windsurf>
 <650761555.1610.1523806309320.JavaMail.zimbra@datacom.ind.br>
 <20180415201808.013e84f3@windsurf.numericable.fr>
 <20180415185828.GD21958@scaer>
 <1990213039.2807.1523823774902.JavaMail.zimbra@datacom.ind.br>
 <eb2e030a-c7de-60e5-b92f-4c0eb02742f1@mind.be>
 <20180514085706.086830e9@windsurf.home>
Message-ID: <20473345.287969.1526296876360.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Arnout Vandecappelle" <arnout@mind.be>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "Yann Morin" <yann.morin.1998@free.fr>, "buildroot"
> <buildroot@buildroot.org>, "Aleksander Morgado" <aleksander@aleksander.es>, "Peter Korsgaard" <peter@korsgaard.com>
> Sent: Monday, May 14, 2018 3:57:06 AM
> Subject: Re: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset variable in init script

> Hello,
> 
> On Mon, 16 Apr 2018 17:53:25 +0200, Arnout Vandecappelle wrote:
> 
>> > So I will prepare a series removing the tests from the startup scripts.
>> 
>>  Well, part of the position we already stated a few times in the past is that we
>> should make our sysvinit scripts conform to a pattern. So I think the optimal
>> approach is:
>> 
>> 1. Update the sysvinit scripts of one or two packages to conform to this
>> pattern. Note that we have not really discussed the actual pattern, just a few
>> preferences (e.g. don't test for the existence of the daemon). So it is
>> important to update only one or two scripts so we can get convergence on the
>> desired pattern, before updating many more packages.
>> 
>> 2. Document this pattern in the manual. For me, it would be sufficient to refer
>> to an existing sysvinit script rather than repeating it in the manual.
>> 
>> 3. Update more packages.
>> 
>> 4. Add some support to check-package to identify common mistakes in the pattern.
> 
> Agreed on this plan.
> 
> Anybody interested in this effort ?

I already have some scratches and will send some patches as soon as
possible. <o/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
