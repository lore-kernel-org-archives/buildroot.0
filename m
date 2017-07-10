From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 23:53:20 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: unbreak run-tests -l
In-Reply-To: <20170710204007.8402-1-arnout@mind.be>
References: <20170710204007.8402-1-arnout@mind.be>
Message-ID: <20170710235320.333b694c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 22:40:06 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> In commit b78b50465c20c1733753a8dd47945cf80c9155f8, the initialisation
> of BRTest.builddir was moved to the __init__ function. However, it is
> set based on BRTest.outputdir and that is only set when the -o argument
> is given to run-tests. When called as "run-tests -l", there is no -o
> argument so BRTest.outputdir remains unset.
> 
> To fix, keep BRTest.builddir at None when BRTest.outputdir is None.
> 
> While we're at it, drop the direct access to the class member. If a
> subclass wishes to set outputdir to something else before calling
> BRTest.__init__, they are free to do so.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/testing/infra/basetest.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
