From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 17:47:01 +0200
Subject: [Buildroot] [PATCH 1/1] docker-engine: fix handling of vendor
 tree
In-Reply-To: <20170418075359.31520-1-christian@paral.in>
References: <20170418075359.31520-1-christian@paral.in>
Message-ID: <20170418174701.40bb3104@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Apr 2017 03:53:59 -0400, Christian Stewart wrote:
> The latest docker-engine release changes the vendor tree slightly. The Go tool
> will recognize a ./vendor directory and use it as a vendor tree
> automatically, but only when run inside a valid GOPATH. This patch
> adjusts how the GOPATH is built - now docker/docker is linked into a
> blank tree, and the Go tool recognizes the ./vendor directory
> correctly.
> 
> The deleted patch is no longer necessary as of the last release and
> causes a build failure on my machine.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
