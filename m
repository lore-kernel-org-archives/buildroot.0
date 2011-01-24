From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 18:22:47 +0100
Subject: [Buildroot] qtwebkit illegal instruction problem with external
 toolchain
In-Reply-To: <BAY145-ds17A7EE20590429F8F04A44C2F40@phx.gbl>
References: <AANLkTinGoE2b8t1YA7bu-ontgi++0RaGz9jNN8r_SU5t@mail.gmail.com>
	<BAY145-ds17A7EE20590429F8F04A44C2F40@phx.gbl>
Message-ID: <20110124182247.1b120be8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jan 2011 11:45:44 -0700
Matt Johnson <mj1856@hotmail.com> wrote:

> Haven't tested webkit, but this is probably the same issue I've been finding
> in lots of other packages.  CodeSourcery is a multilib toolchain, and it
> picks its library based on the machine architecture flag (-march).  It
> assumes armv5te by default, so it is critical when you are targeting one of
> the other libraries like armv4t or armv7-a (thumb) to provide -march to the
> package.  This is part of the $(TARGET_CFLAGS) variable, but some packages
> don't pass it properly.

Yes, quite likely.

Marek, could you give us some details about your hardware configuration
(which CPU type) and Buildroot configuration ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
