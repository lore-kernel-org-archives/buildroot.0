From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 12 Jun 2008 21:26:16 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
References: <20080611161156.33737116@crazy><46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com><20080611154121.GI3795@mx.loc>
	<20080612095933.25f3345e@crazy><871w33doy1.fsf@macbook.be.48ers.dk><0c2401c8cc99$baad47c0$0c0514ac@atmel.com><87hcby8xmw.fsf@macbook.be.48ers.dk><0cd501c8cca5$1be1eb80$0c0514ac@atmel.com>
	<87ej725zla.fsf@macbook.be.48ers.dk>
Message-ID: <011f01c8ccc2$3d652660$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Ulf> In August I think there will be time for implementation,
> Ulf> but we could discuss the underlying architecture before that.
> 
> Yes.
> 

How about this as a starting point?
The user can choose to define a "distribution" inside menuconfig.
There are a number of "known" distributions, which can be checked
for selection, or the user can supply free text.

The distribution is used to select a file containing package versions.

I.E:
BASH_VERSION:=1.10.3
LIBUSB_VERSION:=1.4.5
...
<EOF>

Any version defined here, will override the version number inside
the package makefile fragment.

All packages where this is supported, should have the patches named
<package>-<version>-<patchname>.patch[.$(ARCH)]

There should be a makefile targer to generate such version files.

As long as the package makefile does not change, you can easily 
bump package version with this method.

A user can edit a file if the default is not OK.

Best Regards
Ulf Samuelsson
