From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 13:43:09 +0200
Subject: [Buildroot] [PATCH] package/civetweb: fix linking failure due
 to wrong OpenSSL passed to pkg-config
In-Reply-To: <20190410103746.18403-1-giulio.benetti@micronovasrl.com>
References: <20190410103746.18403-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190410134309.2b1fbaa6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 12:37:46 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> On commit 027a8b29f1e62d5ff5bbb15b79376614f902a680 pkg-config has been
> added to retrieve OpenSSL dependencies, but it's been passed `libssl`
> instead of `openssl`, this makes fail some linking. Indeed we need
> OpenSSL dependency, so let's use `openssl` with pkg-config.
> 
> Substitute `libssl` with `openssl`.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b22/b225425ee237852bd9fee4ca0b8d24f3e37d64f9/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/civetweb/civetweb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
