From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Nov 2013 11:38:42 +0100
Subject: [Buildroot] longterm kernel releases: version-URI different for
 v2.x kernels
In-Reply-To: <76128FA7-9969-4BC7-B8F8-07F5BEDDD177@ipfabrics.com>
References: <76128FA7-9969-4BC7-B8F8-07F5BEDDD177@ipfabrics.com>
Message-ID: <20131116113842.1c01a56d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rick Robino,

On Fri, 15 Nov 2013 23:53:40 -0800, Rick Robino wrote:

> I encountered problems automatically downloading kernel version
> 2.6.32.61, one of the current longterm releases.  It looks like the
> URL might have changed, so I thought that I would mention it here in
> case this fact might be news to anyone.
> 
> The longterm kernels are in a subdirectory called
> ?v2/.6/longterm/vA.B.C?.  Buildroot only looks in ?v2.6?, which works
> fine for standard kernels but not the longterm ones for 2.6.

Yes. Buildroot cannot guess if the kernel version you're using is a
"normal" version or a "longterm" version. Therefore, when you choose to
only give the kernel version in the configuration, it only looks in
2.6/ or 3.x/. If you need a kernel version that is available in some
other location, then you should use the "Custom tarball" configuration
choice, which allows you to pass an arbitrary URL to a tarball,
either located on kernel.org or on some other place.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
