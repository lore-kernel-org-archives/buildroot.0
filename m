From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:46:09 +0100
Subject: [Buildroot] [PATCH next 1/2] package/pkg-luarocks: drop flock
 at installation time
In-Reply-To: <20181119103227.24726-2-thomas.petazzoni@bootlin.com>
References: <20181119103227.24726-1-thomas.petazzoni@bootlin.com>
 <20181119103227.24726-2-thomas.petazzoni@bootlin.com>
Message-ID: <20181119214609.0e93ded5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Nov 2018 11:32:26 +0100, Thomas Petazzoni wrote:
> In commit 22b327fc743b48a33aec0a9190bd67118641b294 ("pkg-luarocks: fix
> top-level parallel makefile support"), a flock on $(TARGET_DIR) was
> added to ensure that two Luarocks packages are not installed at the
> same time.
> 
> However, to support top-level parallel build, we have now clearly
> decided that per-package folders is a requirement. Therefore,
> TARGET_DIR is anyway going to be different for each package, making
> this flock unnecessary.
> 
> Trying to use top-level parallel build without per-package folder is
> simply not supported, so this commit drops the unnecessary flock.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-luarocks.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
