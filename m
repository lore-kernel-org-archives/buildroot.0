From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 22:37:03 +0200
Subject: [Buildroot] [PATCH v3] Remove -fPIC on x86_64
In-Reply-To: <1342011438-13433-1-git-send-email-arnout@mind.be>
References: <1342011438-13433-1-git-send-email-arnout@mind.be>
Message-ID: <20120713223703.60bd042c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 14:57:18 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

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

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
