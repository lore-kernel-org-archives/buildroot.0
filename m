From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 21:05:38 +0100
Subject: [Buildroot] inittab for Busybox
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
Message-ID: <20110315210538.1973f87f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2011 14:32:07 -0400
"Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:

> Really!! 'make clean' from Buildroot directory? That's a complete
> rebuild!!

Yes, it is. For now, Buildroot is "nothing" more but a tool that
automates the process of building an embedded Linux system. It is not
very smart, so it cannot remove packages that have been installed, or
revert changes that have been made to the target filesystem.

My view on this: Buildroot has been more or less abandonned until late
2008/early 2009, when Peter took over the maintainership of the
project. Since that time, our main goal was to clean up the existing
code base, keeping the existing feature set (in fact, we added a bunch
of features as well, but we didn't fundamentaly changed how Buildroot
works). Now that this cleanup process is mostly over, I'd say that
solving the issue you're facing here is now on the top priorities of
the project. At least it's where it is on my own Buildroot TODO list.
But there a fairly huge and complex amount of work to do here, so it
isn't going to happen overnight.

> How come then it picked up my other Busybox change without having to
> do a global re-build?

Because when you change the Busybox configuration, we have a make
dependency that makes sure that Busybox gets rebuilt/reinstalled.

But that does not happen when you unselect sysvinit.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
