From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 11:41:25 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <20181107185226.GB4702@scaer>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
 <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
 <20181107174411.0b67a064@windsurf> <20181107185226.GB4702@scaer>
Message-ID: <20181108114125.549ff7c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Wed, 7 Nov 2018 19:52:26 +0100, Yann E. MORIN wrote:

> > Alternatively, maybe we should decide that linux and u-boot are special
> > packages, and just like for those packages we support fetching from
> > custom tarballs and custom Git repositories, we should support fetching
> > from custom local directories (this is what your patch implements, but
> > until now, we have resisted going into this direction).  
> 
> I would say we should not go that route, otherwise it would be difficult
> to resist adding yet more exceptions, for people that have local "forks"
> for some packages. And then it becomes a nightmare to maintain.

Well, there are a few packages that we do consider "special", because
for them we provide the possibility of specifying a custom tarball, a
custom git/hg repository. So we do recognize that some packages are
special, and we have added special logic to them.

So our argument "we don't want to go down that route as it would be a
nightmare to have that for all packages" already doesn't hold very
well: we have some special logic for custom fetching in packages like
linux, uboot or barebox, and we have not accepted to propagate such
logic to other less special packages.

So, we have already identified some special packages for which it makes
sense to provide more flexibility on how to fetch the source code, and
it that sense, providing the option to use a local folder would seem
quite logical.

Don't get me wrong: I am not pushing hard to this patch to be merged. I
just want to point out that the argument we use to reject the patch is
not very solid. And I don't blame you specifically, because I used the
exact same argument :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
