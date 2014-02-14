From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 18:42:56 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356C69506@de02wembxa.internal.synopsys.com>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C692F6@de02wembxa.internal.synopsys.com>
 <20140214151350.54cb66c5@skate> <87k3cxn4c7.fsf@dell.be.48ers.dk>
 <20140214161923.09e10c0f@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C69506@de02wembxa.internal.synopsys.com>
Message-ID: <20140214184256.06435b94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Fri, 14 Feb 2014 17:05:24 +0000, Anton Kolesov wrote:

> I would say that I would prefer to keep current state, because currently master points to our released versions, which are pretty much of a known entity for us, even if with some known failures. Latest commits haven?t been completely tested, so while they fix some bugs, they might introduce some new undiscovered troubles as well, so I don't feel safe about pointing to them in the buildroot release.

Ok, no problem!

> Since it is a problem of our tools, I can volunteer to prepare patches that disable reverse dependencies of libxml for ARC in master, though you still will have to apply them :) 
> 
> I will ask our team opinion on this as well. And let me know if you are ok if I we just disable failing packages in master.

I believe it's ok to disable failing packages in master, except when
they have too many reverse dependencies and that we know the problem
will be fixed soon. For such cases, I can simply add an exception to
the autobuilder script.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
