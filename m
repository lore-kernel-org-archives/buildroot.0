From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2010 15:42:02 +0100
Subject: [Buildroot] buildroot for older uClibc
In-Reply-To: <fa63ee051002250621t4e0c2cbdk94c9dfa165a297d8@mail.gmail.com>
References: <fa63ee051002250621t4e0c2cbdk94c9dfa165a297d8@mail.gmail.com>
Message-ID: <20100225154202.53c82f09@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Feb 2010 14:21:02 +0000
daniel wilson <daniel.a.wilson@gmail.com> wrote:

> I'm working with a legacy embedded platform which has some closed
> binaries that are linked against uClibc 0.9.28.  Much as I would like
> to bring this platform up-to-date, I'm reliant on these utilities for
> the correct operation of various bits of hardware.  To cut a long
> story short, I think I'm going to have to build myself a toolchain
> which links against uClibc 0.9.28 to produce software for this
> platform.
> 
> I've downloaded various older versions of buildroot, but none of them
> seem to have this version of uClibc as an option.

In the current version of Buildroot, we still offer 0.9.28.3 as a
choice, but you have to enable BR2_DEPRECATED to see it.

However, be warned that the version of uClibc is not the only thing.
You have to create a uClibc with a configuration that is similar to the
uClibc that was used by the binaries at the time they were generated.
Depending on the configuration, the uClibc API/ABI changes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
