From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Sep 2015 10:17:58 +0300
Subject: [Buildroot] [v2 1/2] openssl: use git formatted patches
In-Reply-To: <1442362348-14731-2-git-send-email-ryanbarnett3@gmail.com>
References: <1442362348-14731-1-git-send-email-ryanbarnett3@gmail.com>
 <1442362348-14731-2-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150916071758.GD11632@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Tue, Sep 15, 2015 at 07:12:27PM -0500, Ryan Barnett wrote:
> Using Git formatted patches makes it easier to adjust the patches when
> needed.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> CC: Gustavo Zacarias <gustavo@zacarias.com.ar>
> CC: Arnout Vandecappelle <arnout@mind.be>

[...]

> diff --git a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> similarity index 82%
> rename from package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
> rename to package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> index 19ed5e7..c5d05a5 100644
> --- a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
> +++ b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> @@ -1,14 +1,24 @@
> +From 16f5e2a8ec5909f94a91a87046cbed091ee880e1 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Sat, 16 May 2015 18:55:08 +0200
> +Subject: [2/2] cryptodev: Fix issue with signature generation
> +
>  Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
>  from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
>  It was originally targetted at 1.0.2-beta3.
>  
>  Without this patch digest acceleration via cryptodev is broken.
>  
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Why do you remove Gustavo's signoff?

> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> +---
> + crypto/engine/eng_cryptodev.c | 195 +++++++++++++++++++++++++++++++-----------
> + 1 file changed, 146 insertions(+), 49 deletions(-)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
