From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 8 Oct 2016 15:56:49 +0200
Subject: [Buildroot] [PATCH] package/gcc: nios2 Backport nios2 r31 fix
In-Reply-To: <1475934412-29919-1-git-send-email-romain.naour@gmail.com>
References: <1475934412-29919-1-git-send-email-romain.naour@gmail.com>
Message-ID: <a1ae8782-6031-5393-c289-44f8ae46e246@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 08/10/2016 ? 15:46, Romain Naour a ?crit :
> As reported on the mailing list, gcc5 with binutils 2.26.1 produce some
> assembler error "r31 cannot be used with jmp; use ret instead" [1]
> 
> The bug is reported upstream [2], but gcc 5.4 needs an upstream patch to
> fix this issue.
> 
> Note: openembedded backported the same patch for gcc 5.3 [3]

Sorry, I forgot to amend the commit with the autobuilders references:

alsa-lib:
http://autobuild.buildroot.net/results/1fc9806a62b813b085c39d36000f4d9d18f779df
http://autobuild.buildroot.net/results/03eb11b6a783da1985c19858f6c5f69027e0ed9c
http://autobuild.buildroot.net/results/d620812ae79c4e8252d2b0c410f94e9cdcbcfbc3
http://autobuild.buildroot.net/results/04b7609f5decc71bf25e981f14756029715fc621
http://autobuild.buildroot.net/results/e85be7ffd62e7ab95c4dd0049b0c67ae98f75543

freeswitch:
http://autobuild.buildroot.net/results/96f69b7be1978f85271e2827c2e18d4ed8de8dfc

flac:
http://autobuild.buildroot.net/results/fb3/fb36a9939cac82dc187b64fae93720ea1930f343

libmodplug:
http://autobuild.buildroot.net/results/f12/f12a5d5b4f5338438fbb053ec013e69559eaaa0c

[...]

Romain
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-September/172932.html
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=20674
> [3] http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117633.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
