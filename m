From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Feb 2013 07:54:31 +0200
Subject: [Buildroot] [PATCH v2] crda: new package
In-Reply-To: <5123740E.6040203@siganos.org>
References: <5123740E.6040203@siganos.org>
Message-ID: <20130228055431.GA19549@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dimitrios,

On Tue, Feb 19, 2013 at 12:46:06PM +0000, Dimitrios Siganos wrote:
> From 23f7a55f8c06a098c8d6bc8f56021f9954159419 Mon Sep 17 00:00:00 2001
> From: Dimitrios Siganos <dimitris@siganos.org>
> Date: Fri, 15 Feb 2013 11:52:25 +0000
> Subject: [PATCH 02/11] crda: new package
> 
> 
> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
> ---
>  package/Config.in          |    1 +
>  package/crda/Config.in     |   12 ++++++++++
>  package/crda/crda.mk       |   32 ++++++++++++++++++++++++++
>  package/crda/keys-gcrypt.c |   53 ++++++++++++++++++++++++++++++++++++++++++++
>  package/crda/keys-ssl.c    |   38 +++++++++++++++++++++++++++++++

Please explain what these two .c files are, and why they are needed. Adding 
them as patches may be preferable, since you won't have to copy them 
explicitly.

[...]

> +CRDA_DEPENDENCIES = host-pkgconf libnl libgcrypt wireless-regdb

You need to add a 'select' for libnl, libgcrypt, and wireless-regdb in your 
Config.in.

> +CRDA_LICENSE := ISC
> +CRDA_LICENSE_FILES := LICENSE

Please use '=' only.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
