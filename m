From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 22:50:20 +0100
Subject: [Buildroot] [PATCH] rauc: target rauc needs unsquashfs at
 runtime
In-Reply-To: <20181217221500.7317-1-tpiepho@impinj.com>
References: <20181217221500.7317-1-tpiepho@impinj.com>
Message-ID: <20181218225020.4ca03af4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Dec 2018 22:15:19 +0000, Trent Piepho wrote:
> In order to provide info about a bundle file, e.g. running "rauc info
> bundle.raucb", rauc needs to use the unsquashfs progam from the squashfs
> package.
> 
> This was not documented until upstream commit 10c501c12752 ("docs:
> integration: document need for 'unsquashfs' tool for 'rauc info'"), but
> is already present in rauc.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/rauc/Config.in | 1 +
>  1 file changed, 1 insertion(+)

I am not familiar with rauc, so sorry for what is perhaps a silly
question: is squashfs needed in all cases, or just for a certain bundle
format, or certain use cases ?

I'm just trying to figure out if we really want this to be a mandatory
dependency, or rather not enforce it, and simply document that it might
be needed.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
