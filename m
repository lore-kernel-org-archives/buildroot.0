From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:44:54 +0200
Subject: [Buildroot] [PATCH] dropwatch: fix static link
In-Reply-To: <ac1c987b7db40c08775f3f8d61be85e33a411195.1498798114.git.baruch@tkos.co.il>
References: <ac1c987b7db40c08775f3f8d61be85e33a411195.1498798114.git.baruch@tkos.co.il>
Message-ID: <20170701124454.7b03fc23@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 07:48:34 +0300, Baruch Siach wrote:
> Use LDLIBS for the list of libraries, since LDFLAGS appear before the source
> files in the link command, and the upstream LDLIBS lacks -lncurses which is a
> dependency of readline. We already pass target LDFLAGS in
> TARGET_CONFIGURE_OPTS, so drop that part.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ce4/ce436bdd7e7950c801edac01f311b89110d87d62/
> http://autobuild.buildroot.net/results/691/691d61d13849150c3616b1c74c964f50118ff1d9/
> http://autobuild.buildroot.net/results/291/2918c75e473c5a2434e72f2e409becc5b4d07908/
> 
> Cc: Tzu-Jung Lee <roylee17@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dropwatch/dropwatch.mk | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
