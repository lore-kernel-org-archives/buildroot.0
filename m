From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 13:09:07 +0100
Subject: [Buildroot] [PATCH 1/1] setools: disable arch sparc64
In-Reply-To: <1458698562-11227-1-git-send-email-matt@thewebers.ws>
References: <1458698562-11227-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160323130907.3c2c28ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 21:02:42 -0500, Matt Weber wrote:
> Currently the buildroot sparc64 toolchain encounters a series of relocation
> errors.  i.e.
> policy_scan.c: relocation truncated to fit: R_SPARC_GOT13 against symbol ....
> 
> Workaround for numerous autobuilder failures, including:
> http://autobuild.buildroot.net/results/ba1/ba1e473178bb66ebc43897b20e534606d2577ee3/
> 
> Signed-off-by: Matt Weber <matt@thewebers.ws>
> ---
>  package/setools/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

IMO, it can be made to work quite easily on sparc64, it's just a matter
of using -fPIE to build, and not -fpie.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
