From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:31:32 +0100
Subject: [Buildroot] [git commit] package/flashrom: fix build on riscv
In-Reply-To: <20210216214220.034D882286@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 16 Feb 2021 23:02:37 +0100")
References: <20210216214220.034D882286@busybox.osuosl.org>
Message-ID: <87zh032dff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7d73bc52164afbb283d0d8723ed4cf0cbca38521
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Retrieve an upstream patch to fix build with riscv as it fails to
 > retrieve architecture due to "Use sigaction with SA_RESTART instead"
 > being caught before riscv:

 > exec: export LC_ALL=C ; {
 > /home/fabrice/buildroot/output/host/bin/riscv32-linux-gcc
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -E
 > archtest.c 2>/dev/null | grep -v ^# | grep ' | cut -f 2 -d' ; }
 > Use sigaction with SA_RESTART instead
 > riscv

 > Fixes:
 >  - http://autobuild.buildroot.org/results/61ac6c9bfcd3bd9306aa49faf47b9f16e5abe846

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
