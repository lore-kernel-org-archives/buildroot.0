From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 22:39:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/haproxy: install only binary
In-Reply-To: <20200203205256.2508469-1-fontaine.fabrice@gmail.com>
References: <20200203205256.2508469-1-fontaine.fabrice@gmail.com>
Message-ID: <20200203223940.3b9c4d0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 21:52:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use install-bin instead of install target to avoid installing doc and
> man pages
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/haproxy/haproxy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

doc and man pages get removed by target-finalize, so we're not really
interested in doing "special" things to avoid their installation, even
if admittedly in this case the "special" thing is pretty basic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
