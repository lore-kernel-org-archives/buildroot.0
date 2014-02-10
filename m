From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 13:15:56 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <52F8B87C.4070201@andin.de>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
 <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
 <20140207162934.01acfe5a@skate>
 <CAHkwnC-pAGs0DCu80X3_AQgrsxcOO82GMY7NwmegxT6V0_kwJw@mail.gmail.com>
 <20140207174355.383b6bb3@skate> <52F8B87C.4070201@andin.de>
Message-ID: <20140210131556.4498d0d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Mon, 10 Feb 2014 12:31:08 +0100, Andreas Naumann wrote:

> > If we want to get this to the next level, someone need to experiment
> > with per-package sysroot. Of course, this would be a long experiment,
> > without necessarily at the end the guarantee that we will accept it,
> > because it may be too complex to match Buildroot simplicity principle.
> 
> as I said, we have hacked br to a per-package sysroot in the past. This 
> was in order to create isolated ipkgs and did its job. Even if we dont 
> solve any of the dependency issues with that, it could be a starting 
> point. If this is of  interest I can try to go further with it.

Investigation in this area are definitely welcome. But as I said, we
cannot guarantee that it will be merged: it will highly depends on how
much additional complexity it will add.

> And for the depency issue, how does OE solve it?

I don't know exactly. The author of oe-lite (http://oe-lite.org/) told
me that they don't do per-package sysroot (which in his opinion is
fundamentally wrong when you do parallel build of multiple packages),
and it indeed seems to be the case from a quick look at what Yocto is
doing. That being said, my knowledge of OE/Yocto internals is almost
non-existent, so I don't know how they solve this problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
