From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:26:20 +0100
Subject: [Buildroot] [PATCH] lttng-tools: needs glibc
In-Reply-To: <80f0f99699bcdacbed2aa551ef3051ab5dd45280.1505468019.git.baruch@tkos.co.il>
References: <80f0f99699bcdacbed2aa551ef3051ab5dd45280.1505468019.git.baruch@tkos.co.il>
Message-ID: <20171123232620.2e1f3257@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Sep 2017 12:33:39 +0300, Baruch Siach wrote:
> This commit partially reverts commit a6bb295642919 (lttng-tools: update
> to 2.9.5) that enabled lttng-tools for uClibc and musl. Upstream code
> does not detect dlmopen() specifically. configure only checks which
> library defines dlopen(), and fails the configuration when none is
> found. The code of the prog.c test still relies on dlmopen() GNU
> extension that uClibc and musl do not implement currently.
> 
> Fixes:
> http://autobuild.buildroot.net/results/add/add97b4b3f45841249f239367452205c38d4e4df/
> http://autobuild.buildroot.net/results/382/3825c88bb8a23708e4c2fed99f2417555078c65a/
> http://autobuild.buildroot.net/results/4ae/4aef36977f039a1533b409a7c172f0ceaa2c6088/
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Philippe Proulx <eeppeliteloop@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lttng-tools/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

This patch is no longer needed, thanks to
https://git.buildroot.org/buildroot/commit/?id=9dd25fe977867a2e7ef1ba40c3cbd12953ecaf51,
so I've marked your patch as Rejected. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
