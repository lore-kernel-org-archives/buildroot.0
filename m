From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 23:04:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix build on riscv
In-Reply-To: <20210207195733.3152422-1-fontaine.fabrice@gmail.com>
References: <20210207195733.3152422-1-fontaine.fabrice@gmail.com>
Message-ID: <ff7903ef-870b-124b-be2d-47216621bd45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/02/2021 20:57, Fabrice Fontaine wrote:
> Retrieve an upstream patch to fix build with riscv as it fails to
> retrieve architecture due to "Use sigaction with SA_RESTART instead"
> being caught before riscv:
> 
> exec: export LC_ALL=C ; { /home/fabrice/buildroot/output/host/bin/riscv32-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -E archtest.c 2>/dev/null | grep -v ^# | grep ' | cut -f 2 -d' ; }
> Use sigaction with SA_RESTART instead
> riscv
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/61ac6c9bfcd3bd9306aa49faf47b9f16e5abe846
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout
