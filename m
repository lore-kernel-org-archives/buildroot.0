From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Nov 2014 12:18:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-15
In-Reply-To: <20141116105222.GC3965@free.fr>
References: <20141116073012.7E89F101413@stock.ovh.net>
 <20141116105222.GC3965@free.fr>
Message-ID: <20141116121859.3e6d8eaf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Nov 2014 11:52:22 +0100, Yann E. MORIN wrote:

> That's weird:
> 
>     cap_file.c: In function 'cap_get_fd':
>     cap_file.c:190:33: error: 'XATTR_NAME_CAPS' undeclared (first use in this function)
> 
> XATTR_NAME_CAPS was introduced in Linux 2.6.24, and the toolchain is
> from CodeSourcery, and uses headers from Linux 2.6.38. So
> XATTR_NAME_CAPS ought to be present. But it is not:
> 
>     $ grep -r XATTR_NAME_CAPS freescale-2011.03
>     [--nothing, zilch, nada, keudale--]
> 
> Grr... :-(
> 
> So, I would be inclined on making libcap require headers >= 3.0 anyway.
> But that has to be propagated to a few packages:
> 
>     cdrkit, lxc, ofono, squid (and systemd, but it already requires
>     headers >=3.7 anyway)
> 
> Thoughts?

We anyway don't have any options today to distinguish between things
added within different versions of the 2.6.x kernels. We have such
options for each individual 3.x kernel, but we handle all 2.6.x kernels
as just one case. Considering this, even though the CodeSourcery
toolchain is indeed broken, I believe depending on >= 3.0 is the right
course of action.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
