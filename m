From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Mar 2021 23:58:15 +0100
Subject: [Buildroot] [PATCH] package/openssl: fix build on riscv32
In-Reply-To: <20210302215147.1556308-1-yann.morin.1998@free.fr>
References: <20210302215147.1556308-1-yann.morin.1998@free.fr>
Message-ID: <801c510a-dc42-4336-c456-41ce96157c11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/03/2021 22:51, Yann E. MORIN wrote:
> riscv32 is (surprise!) a 32-bit architecture. But it has been 2038-safe
> from its inception. As such, there is no legacy binaries that may use
> the 32-bit time syscalls, and thus they are anot available on riscv32.
> 
> Code tht directly calls to the syscalls without using the C libraries
> wrappers thus need to handle this case by themselves.
> 
> Backport a patch from the upstream development branch that will
> eventually be openssl 3.0, but has not yet been backported to the 1.1.1
> stable branch.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/eb9/eb9a64d4ffae8569b5225083f282cf87ffa7c681/
>     ...
>     http://autobuild.buildroot.org/results/07e/07e413b24ba8adc9558c80267ce16dda339bf032/
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Mark Corbin <mark@dibsco.co.uk>


 Applied to master, thanks.

 Regards,
 Arnout
