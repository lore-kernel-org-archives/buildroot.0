From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 09:45:06 +0100
Subject: [Buildroot] [PATCH 1/1] pps-tools: also pass
 TARGET_CONFIGURE_OPTS to make install
In-Reply-To: <1422835088-11852-1-git-send-email-bluemrp9@gmail.com>
References: <1422835088-11852-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <20150202094506.72669c5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Sun,  1 Feb 2015 16:58:08 -0700, Ryan Coe wrote:
> Without these environment variables, pps-tools rebuilds for the host machine
> architecture and does not run on the target machine.
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/pps-tools/pps-tools.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

We just discussed here at the Buildroot meeting that we should probably
add a post-build check that verifies that all binaries that have been
installed to the root filesystem are actually built for the correct
architecture.

Thanks for the report and patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
