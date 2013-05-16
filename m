From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 09:51:17 +0200
Subject: [Buildroot] Fwd: graph-depends with jpeg?
In-Reply-To: <CANxTyt7MqE-gbQ_htn50ooFqUR72Lo5CgNbhmYz6kRiHfASyEw@mail.gmail.com>
References: <CANxTyt5xEi8MTpEwh_BGhtcUo6NVZK7-z1PenKCEu+QEosQPwg@mail.gmail.com>
 <CANxTyt7MqE-gbQ_htn50ooFqUR72Lo5CgNbhmYz6kRiHfASyEw@mail.gmail.com>
Message-ID: <20130516095117.44ce660c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 15 May 2013 19:45:05 -0400, Danomi Manchego wrote:

> Sorry, just realized that the jpeg package has changed to have use the pkg
> infrastructure, solving that one.  I still get stopped on target-purgelocales
> though ...

Yeah, one of the reason the virtual jpeg was converted to the package
infrastructure was to make the graph-depends script work. That said, I
would have liked to have a way to find out that a package is virtual,
so that it could be shown differently in the graph. Maybe we should
have named all such packages virtual-<something> ? Not sure.

Regarding target-purgelocales, just add it to the TARGET_EXCEPTIONS
array in the graph-depends script. I really need to find some time to
separate TARGETS from a new PACKAGES variable to avoid this exception
thing.

Thanks for the report,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
