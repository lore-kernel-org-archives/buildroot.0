From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2009 08:26:20 +0200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
References: <4AA775760200006C0000A21D@gwia.alliedtelesyn.co.nz>
	<4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
	<4AA77AA40200007000017857@gwia.alliedtelesyn.co.nz>
Message-ID: <20090909082620.12a60a18@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 09 Sep 2009 09:51:32 +1200,
"angus salkeld" <angus.salkeld@alliedtelesis.co.nz> a ?crit :

> Well you could treat crosstool-ng as just another package that is
> available to build.
> So if you select crosstool-ng, buildroot automatically sets up the
> correct external toolchain options.

That's my long term plan. Introduce a new toolchain type in Buildroot:
Crosstool-NG toolchain. Just like for uClibc today, Buildroot would
produce/tune the Crosstool-NG configuration before running the
Crosstool-NG compilation process. We could have this in parallel to the
internal building system for toolchains for a while, and then when
we're satisfied, switch to Crosstool-NG completely by removing the old
mechanism.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
