From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:58:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mender: bump to version 2.0.0
In-Reply-To: <20190529123727.47147-1-aduskett@gmail.com>
References: <20190529123727.47147-1-aduskett@gmail.com>
Message-ID: <20190531225833.3b1bab05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Wed, 29 May 2019 08:37:27 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> In addition:
>   - Update hashes for license files due to copyright year change.
>   - Add hash for vendor/golang.org/x/text/LICENSE
>   - Add hash for vendor/github.com/mendersoftware/go-liblzma/LICENSE
>   - Add new dependency xz, as mender now depends on LZMA.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied to next, but there were still a few issues to fix up.


> diff --git a/package/mender/mender.hash b/package/mender/mender.hash
> index 89aec239b1..70d3b858eb 100644
> --- a/package/mender/mender.hash
> +++ b/package/mender/mender.hash
> @@ -1,41 +1,44 @@
>  # Locally computed:
> -sha256 caee18d1b8446df0cbb9a9c5a1c040d7eb1924332da94c3489494443a8077eb8 1.7.0.tar.gz
> +sha256 af37a11c4189097b485254c35450f289b078bc61f6a230d6540743f202d81b98 2.0.0.tar.gz
>  
>  # Apache-2.0 license, locally computed
> -sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
> +sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE

So, we have the hash for the LICENSE once.

>  
>  # Vendor licenses
>  # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
>  
>  # Apache-2.0 license.
> -sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7  vendor/github.com/mendersoftware/mendertesting/LICENSE
> -sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/log/LICENSE
> -sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/log/COPYING
> -sha256 3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/scopestack/LICENSE
> -sha256 bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/scopestack/COPYING
> -sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  vendor/github.com/mendersoftware/mender-artifact/LICENSE
> +sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  LICENSE

And then a second time.

> +sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
> +sha256  3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/log/LICENSE
> +sha256  bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/log/COPYING
> +sha256  3591f687e2d6f49c83b1ec69577e8110afbde80be5ec81791bd86d2838ccd3de  vendor/github.com/mendersoftware/scopestack/LICENSE
> +sha256  bbb303820971c294a9a8e5eba5affcf1379036e877ea61c11cbf9400b2949483  vendor/github.com/mendersoftware/scopestack/COPYING
> +sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mender-artifact/LICENSE

In addition, in all the changes in this file, you are switching between
one space between the hash type and the hash itself to two white
spaces. Due to this, the patch has a lot of noise: even if the hash
didn't change, your white space change causes a modification. So I
reverted all those white space changes to minimize the patch, and make
it clear which hashes have changed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
