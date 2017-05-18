From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 May 2017 11:11:24 +0200
Subject: [Buildroot] [PATCH] package/ntp: fix aarch64/mips build,
 -fPIC required
In-Reply-To: <e27400a3-9128-57f5-57a3-d85cd307eb3d@imgtec.com>
References: <20170513214917.3305-1-romain.naour@gmail.com>
 <20170517214810.35d31ce4@free-electrons.com>
 <e27400a3-9128-57f5-57a3-d85cd307eb3d@imgtec.com>
Message-ID: <20170518111124.76c71dbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 10:02:26 +0100, Vicente Olivert Riera wrote:

> thank you very much for fixing this! It's sad that we have to use such
> kind of hacks or patches to fix something that shouldn't happen at all,
> since the ntp configure script can accept --with-pic=yes.

Not sure what you mean here. The ntp configure script detects if fPIC
is needed or not. The only thing that was missing is that this flag was
not propagated to ntpq/Makefile.am.

See my final commit,
https://git.buildroot.org/buildroot/commit/?id=7fde83cdf0da338937dae13144eea2923e5c2730.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
