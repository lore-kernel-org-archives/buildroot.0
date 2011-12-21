From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 09:38:30 +0100
Subject: [Buildroot] [PATCH v3 2/2] New package: python-dpkt
In-Reply-To: <4EF19726.3070605@visionsystems.de>
References: <1323877116-31436-1-git-send-email-yegorslists@googlemail.com>
 <201112210754.28934.arnout@mind.be> <20111221091337.1d310b75@skate>
 <4EF19726.3070605@visionsystems.de>
Message-ID: <20111221093830.1440d9a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Dec 2011 09:21:58 +0100,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> What would speak against compiling host-python with zlib support? I
> think we'll need it for host-setuputils anyway. AFAIK python-dpkt
> seems to be neglected for quite a while. Though I submitted a bug
> report: http://code.google.com/p/dpkt/issues/detail?id=82, I don't
> think it will be accepted shortly. 
> 
> Should I prepare a patch for host-python with zlib support?

Adding zlib support in host-python just because dpkt includes itself in
its setup.py script is silly. If all packages do that, then we'll end
up adding cairo support in host-python, just because some Python module
relying on cairo includes itself in its setup.py script.

That said, if zlib support in host-python is needed for
host-setuputils, then it's a different story and zlib support can be
enabled in host-python. But I definitely don't want the host-python to
be cluttered with more and more things simply because some packages do
silly stuff in their setup.py.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
