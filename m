From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 12:44:34 +0200
Subject: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <20190801210920.31338-4-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-4-romain.naour@smile.fr>
Message-ID: <46a14660-516e-46e4-3ecf-5f43b422a5d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2019 23:09, Romain Naour wrote:
> From: Damien DUVAL <damien.duval@smile.fr>
> 
> With a c library which does not provide fenv.h, it won't work at runtime:
> Crash after an "import numpy" on python.
> 
> Since numpy v1.16.0:
> "Alpine Linux (and other musl c library distros) support
> We now default to use fenv.h for floating point status error reporting.
> Previously we had a broken default that sometimes would not report
> underflow, overflow, and invalid floating point operations. Now we can
> support non-glibc distrubutions like Alpine Linux as long as they ship
> fenv.h."
> Also there is a lack of define in glibc for ARC architecture and python
> numpy cannot build.
> The removed patches were just fixes for the build for uclibc and glibc
> for ARC

 Since Alexey indicated that this is not needed any longer, I removed that part
and applied to master, thanks.

 Alexey, could you do a runtime test (based on the one submitted by Romain) for
ARC to be sure? You'll need a qemu for ARC for that, obviously, which is why I'm
asking you instead of doing it myself :-)

 Regards,
 Arnout

> 
> Configurations which does not provide fenv.h (like uclibc) won't be able
> to select the python-numpy package to avoid errors at runtime.
> 
> Signed-off-by: Damien DUVAL <damien.duval@smile.fr>
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
