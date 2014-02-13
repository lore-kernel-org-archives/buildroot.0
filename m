From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 19:54:05 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140213122942.31ce862c@skate>
References: <20140211073008.EC16B101035@stock.ovh.net>
 <20140211101015.1b282bd3@skate> <20140211180123.GB3411@free.fr>
 <20140212090659.15291b2b@skate> <52FBE074.4070005@openwide.fr>
 <20140213122942.31ce862c@skate>
Message-ID: <20140213195405.3f28464d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Feb 2014 12:29:42 +0100, Thomas Petazzoni wrote:

> > I don't think it's related but libhal.h is present on the autobuilder's log
> > "checking for libhal.h... yes"
> > 
> > Maybe add --without-hal in nut.mk ?
> 
> That would certainly be a good idea, but I have a successful build with
> the configuration of the autobuilder. So I'm suspecting a parallel
> build problem maybe, but so far I've attempted maybe builds of nut, and
> none of them failed. I've started a loop that builds nut repeatedly and
> aborts if the build has failed. Hopefully the issue will pop up.

The issue popped up. Not exactly the same, but another case of invalid
stuff being present in an header file. So it really looks like a
parallel build issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
