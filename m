From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 09:55:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <05d32cf1-16bf-98c5-a62a-d1ea4ea8ad11@mind.be>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
 <b94b135b-35c2-ad80-9a99-f14ebfea1e06@mind.be>
 <20170221092754.3dd7bc65@free-electrons.com>
 <05d32cf1-16bf-98c5-a62a-d1ea4ea8ad11@mind.be>
Message-ID: <20170221095503.4b8d9d5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 09:46:03 +0100, Arnout Vandecappelle wrote:

>  An alternative would be to patch jasper itself to define __STDC_LIMIT_MACROS in
> its headers. Far-reaching, but probably harmless. Not sure if such a patch would
> be upstreamable though.

I tried that, but that doesn't work. If you sneak into jas_math.h a:

#define __STDC_LIMIT_MACROS

before it includes <stdint.h>

then in fact it's too late, because for example libraw has already
included <stdint.h> *before* including jas_math.h. And at the time of
this first <stdint.h> include, __STDC_LIMIT_MACROS was not defined.

A nicer option would be for jasper to provide a pkg-config file that
tells its consumers how to compile/link against it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
