From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2011 10:36:53 +0100
Subject: [Buildroot] [PATCH] Remove -fPIC on x86_64
In-Reply-To: <1322816170-27327-1-git-send-email-arnout@mind.be>
References: <1322816170-27327-1-git-send-email-arnout@mind.be>
Message-ID: <20111202103653.377df8b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri,  2 Dec 2011 09:56:09 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> The -fPIC breaks the purgatory of kexec (= the code that passes command-line
> arguments to the kernel): kexec doesn't know how to handle the GOT and PLT
> relocation entries.
> 
> There is also no reason at all to pass -fPIC.  Shared libraries that require
> it will add it to their local Makefiles, and normal executables have no
> business with -fPIC (plus it adds overhead...).
> 
> The -fPIC was added by Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> in commit 8027784c.  That commit adds sysroot parameters to CFLAGS.
> There is no explanation why -fPIC is also added for x86_64.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

This needs some testing, but on the principle, I agree that Buildroot
shouldn't have to add this flag globally to TARGET_CFLAGS.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
