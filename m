From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:16:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: drop unneeded static
 openssl workarounds
In-Reply-To: <20190413150453.30125-1-fontaine.fabrice@gmail.com>
References: <20190413150453.30125-1-fontaine.fabrice@gmail.com>
Message-ID: <20190413211608.284bb58a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 17:04:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> bind can't be built statically since commit
> 6045904752b06a8b8e52ba8fc2e49a8548964e8d
> 
> So drop uneeded LIBS="-lz" which was added by commit
> 80ebf12906afc3a1e5f4e5682d4c5dc0779a556a to fix static build with
> openssl
> 
> Also, drop ac_cv_func_EVP_{sha256,sha384,sha512} that was also added to
> fix tests in static build by commit
> 26aefa672c96caefc17adf59a9ab3d327114ad36
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bind/bind.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
