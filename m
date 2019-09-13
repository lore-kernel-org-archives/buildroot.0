From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 20:37:01 +0200
Subject: [Buildroot] [PATCH] package/bc: bump to 1.07.1
In-Reply-To: <CANQCQpbMuK-zoVeZyLrO3FFkQ5uiiuhs65wVYyScPnCFVmBwiw@mail.gmail.com>
References: <20190912205057.40777-1-matthew.weber@rockwellcollins.com>
 <20190913194622.303b5a31@windsurf.home>
 <CANQCQpY_HqqxoUkAOcxN0_ORRnYLTdUdfBXC=5ZfShXOWCDeCg@mail.gmail.com>
 <CANQCQpbMuK-zoVeZyLrO3FFkQ5uiiuhs65wVYyScPnCFVmBwiw@mail.gmail.com>
Message-ID: <20190913203701.41ad32e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Sep 2019 13:34:01 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> Now I see what happened, I took Gustavo's original which was against
> the Makefile.in.
> 
> I see that Makefile.am has a hardcoded
> MAKEINFO = makeinfo --no-split
> 
> What would you propose I do?  I can see if instead I could set it to
> the following which should also work, or I can just drop this patch
> and see if it is still a corner case that a autobuilder finds....
> MAKEINFO = @MAKEINFO@ --no-split

Using @MAKEINFO@ in the Makefile.am seems like the right thing to do.
It could even be sent upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
