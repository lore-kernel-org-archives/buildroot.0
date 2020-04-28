From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 08:03:28 +0200
Subject: [Buildroot] [PATCH 1/1] support/dependencies: set cmake version
 min to 3.15.3
In-Reply-To: <20200428054352.110007-1-james.hilliard1@gmail.com>
References: <20200428054352.110007-1-james.hilliard1@gmail.com>
Message-ID: <20200428080328.4a06266b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 23:43:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is required by uvw.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ab6/ab6954a65fd6d43c0674cb7a38a941102cb0dfe3/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

The CMake version required by uvw was suddenly bumped from 3.2 to
3.15.3 in upstream commit 55d7782af5654cde8bba89071e13d240fd27ff3b.

From a quick look of it, I don't really see why it was bumped "so
high". Could you instead try to revert to a minimum CMake version of
3.10 in uvw, and see if it builds ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
