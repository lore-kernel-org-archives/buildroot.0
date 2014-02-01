From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Feb 2014 09:42:46 +0100
Subject: [Buildroot] Error building with external toolchain
In-Reply-To: <52EBD7F7.8010504@coloradoengineeringinc.com>
References: <52EBD7F7.8010504@coloradoengineeringinc.com>
Message-ID: <20140201094246.20d7dc22@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danny Gale,

On Fri, 31 Jan 2014 10:05:59 -0700, Danny Gale wrote:

> I'm having some trouble getting buildroot to import my external 
> toolchain properly. The output is:
> 
>  >>> toolchain undefined Extracting
>  >>> toolchain undefined Patching
>  >>> toolchain-external undefined Extracting
>  >>> toolchain-external undefined Patching
>  >>> toolchain-external undefined Configuring
>  >>> toolchain-external undefined Building
>  >>> toolchain-external undefined Installing to staging directory
>  >>> toolchain-external undefined Copying external toolchain libraries 
> to target...
> make[1]: *** 
> [/home/dgale/Documents/system_build/bld/start.buildroot-2013.11/output/build/toolchain-external-undefined/.stamp_staging_installed] 
> Error 255
> make[1]: Leaving directory 
> `/home/dgale/Documents/system_build/bld/start.buildroot-2013.11'
> make: *** [.buildroot] Error 2

Interesting. Can you show your Buildroot .config file, and give more
details about what your external toolchain is (or even better, provide
us this external toolchain so that we can potentially reproduce the
problem) ?

Hum, the order of your messages look weird: the last message shown is
"Copying external toolchain libraries to target", but make reports that
the error occurred while working on the .stamp_staging_installed
target. Maybe it's just me misinterpreting the output of make, I don't
know.

Aren't you running with "make -j<something>" by any chance?

> What is the problem here? Has anybody run into this before? I should 
> mention that the toolchain being imported is 64-bit. This is NOT an 
> issue using an equivalent toolchain at 32-bits. The 64-bit toolchain, 
> however, doesn't support multilib.
> 
> What will be required to get buildroot working with the 64-bit toolchain?

When you're talking about 32 bits or 64 bits, are you talking about the
bitness for the host architecture, or the target architecture?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
