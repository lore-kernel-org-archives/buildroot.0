From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Sep 2017 16:04:01 +0200
Subject: [Buildroot] [PATCH] support/scripts/check-bin-arch: ignore
 symbolic links
In-Reply-To: <20170903142548.GC2786@scaer>
References: <20170903140941.12455-1-thomas.petazzoni@free-electrons.com>
 <20170903142548.GC2786@scaer>
Message-ID: <20170904160401.6a8bb231@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Sep 2017 16:25:48 +0200, Yann E. MORIN wrote:

> > +	# Skip symlinks. Some symlinks may have absolute paths as
> > +	# target, pointing to host binaries while we're building.
> > +	if [[ -L "${f}" ]]; then  
> 
> I don't like that we use the bashism [[...]] when the POSIX [...] works
> perfectly well. And we also use 'test' below, which is not very
> consistent...

Agreed, but there are already such tests in the script, so I just used
the same syntax. We can fix that up as a follow-up patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
