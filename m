From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 16:38:28 +0200
Subject: [Buildroot] Plan of libffi support?
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339F9F24@de02wembxa.internal.synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <20130422180104.2fd1513d@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339F9F24@de02wembxa.internal.synopsys.com>
Message-ID: <20130424163828.5c545de1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Wed, 24 Apr 2013 06:38:29 +0000, Mischa Jonker wrote:

> Yes, it makes perfect sense to add support for ARC here. So this is
> something that we are definitely planning to do in the coming weeks.

Excellent!

> In fact, if you have other suggestions of packages that would require
> specific ARC support, please let me know, so that we can plan for
> these as well (if it makes sense).

From a Buildroot perspective, libffi is really the most annoying
architecture-specific part because it has many, many reverse
dependencies that would all have to be disabled specifically for ARC.
And also because adding a new architecture support in libffi is not
just a matter of adding a few additional defines, it requires a fairly
intimate knowledge of the instruction set and the calling conventions.

The other packages that I can think of that are probably useful when
you start a new architecture are things like strace and ltrace.

But anyway, once the ARC port is in mainline Buildroot, I'll add an ARC
configuration to our autobuilders, and we'll quickly see where the
problems are :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
