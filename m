From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:51:15 +0100
Subject: [Buildroot] [PATCH] python-numpy: re-enable for uClibc
In-Reply-To: <1443972881-24357-1-git-send-email-arnout@mind.be>
References: <1443972881-24357-1-git-send-email-arnout@mind.be>
Message-ID: <20151004175115.7be4e036@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun, 4 Oct 2015 16:34:41 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> In commit b0f025386f6861fdc21e38e3a33b65669276f2c2 a patch was added
> to make sure that python-numpy does work in uClibc. This patch was
> needed for the x86 architecture, because uClibc in fact does support
> fenv for x86. However, we don't turn on this support in our uClibc
> config. Because the Config.in depends still allowed uClibc for x86,
> this lead to a built failure, which lead to the fix in commit b0f02538.
> But since this fix also fixes it for all other (supported)
> architectures, we can just remove the !uClibc dependency completely.
> 
> This is also propagated to the reverse dependency in opencv3.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/opencv3/Config.in      | 1 -
>  package/python-numpy/Config.in | 3 ---
>  2 files changed, 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
