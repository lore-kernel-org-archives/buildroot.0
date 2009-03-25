From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2009 11:24:30 +0100
Subject: [Buildroot] Build fails with external toolchain (sysroots error)
In-Reply-To: <585ACB2A-2E0B-4AA5-9A71-E437724E4018@laptouchinc.com>
References: <585ACB2A-2E0B-4AA5-9A71-E437724E4018@laptouchinc.com>
Message-ID: <20090325112430.0c800cea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Mar 2009 16:26:19 -0400,
Daniel Jabbour <daniel@laptouchinc.com> a ?crit :

> How can I resolve this issue? From my understanding, it seems like
> the sysroots flag is unsupported in my toolchain.

Right.

> Can buildroot work without this option?

As it works today, no. Only sysroot-able toolchains can be used as
external toolchains. The external toolchain support has followed quite
a few variations until we settled on the --sysroot solution, which is
the one that works, on the condition that sysroot is supported by the
toolchain. We had issues with other approaches (based on
--rpath-link).

I'm not sure what to do with this request :

 *) Say that we officially only support sysroot-able toolchains ;

 *) Work more on the --rpath-link issues, and try to find
    solutions to them (if they ever exist)

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
