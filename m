From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:22:27 +0100
Subject: [Buildroot] [PATCH] xapp_xload: fix musl build
In-Reply-To: <20161120222858.10102-1-arnout@mind.be>
References: <20161120222858.10102-1-arnout@mind.be>
Message-ID: <20161121212227.30bed7a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 23:28:58 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> xapp_xload tries to include protocols/rwhod.h, which isn't available on
> musl. Fortunately, the package also has stub code that can be enabled
> with -DRLOADSTUB (this is done e.g. on Cygwin).
> 
> This should probably be detected in configure, but that's a lot more
> work.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/x11r7/xapp_xload/xapp_xload.mk | 5 +++++
>  1 file changed, 5 insertions(+)

You forgot a reference to the autobuilder failure, and I forgot as well
before pushing :/

Applied to master anyway, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
