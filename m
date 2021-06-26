From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 14:35:02 +0200
Subject: [Buildroot] [PATCH] package/resiprocate: enable DES in openssl
In-Reply-To: <20210624140813.206308-1-ryanbarnett3@gmail.com>
References: <20210624140813.206308-1-ryanbarnett3@gmail.com>
Message-ID: <20210626143502.5ac2f2b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2021 09:08:13 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> From: Ryan Barnett <ryan.barnett@collins.com>
> 
> resiprocate security backend assumes that if openssl is enabled that
> it provides DES support. However DES support in openssl has become
> optional since  commit a83d418 ("package/libopenssl: add option to
> enable some features").
> 
> Select openssl DES support in wpa_supplicant Kconfig to avoid build
> failures.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f7def0d5706f9e6ab97accc4eaa5f512a11bcb4c
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@collins.com>
> ---
>  package/resiprocate/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
