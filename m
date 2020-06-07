From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 10:10:49 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/acpica: bump version to
 20200528
In-Reply-To: <20200607073610.16911-1-heiko.thiery@gmail.com>
References: <20200607073610.16911-1-heiko.thiery@gmail.com>
Message-ID: <20200607081049.GN13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-06-07 09:36 +0200, Heiko Thiery spake thusly:
> - Update the hash file to the new 2 spaces convention
> - Update the hash of the license file

We have hashes of license files because we want to be able to detect the
changes, so we can update the licensing information. So, just updating
the hash without saying what changed is side-stepping the very purpose
of the licenses' hash files.

The explanation may well be just (e.g.):

  - copyright year changed in license file; update corresponding hashes

Also, see below...

> Fixes:
> http://autobuild.buildroot.net/results/fe58e834bb67a9aab640e1d913588b47eaf7e4f5/
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/acpica/acpica.hash | 4 ++--
>  package/acpica/acpica.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
> index ac2201d570..961ee9dbe3 100644
> --- a/package/acpica/acpica.hash
> +++ b/package/acpica/acpica.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256 edb9a886455d22955c93753e2de61b780bed94fb434079e844dc5e4376cadd4c  acpica-unix2-20191018.tar.gz
> -sha256 65464cea6ee2f7a5d38e2b5f1050a4b39a15358a09b8e36119416d4e2c5031b8  source/include/acpi.h
> +sha256  ad8a7b1571ec94d8c1837cf0c89ff33ea820780362fbb3e26adbde96beed5205  acpica-unix2-20200528.tar.gz
> +sha256  cb17c679d3291eba1a70a1336062fb07eec2e839b0821b443b24f41de18c5218  source/include/acpi.h
> diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
> index 68b948c86d..8f1a36fbb7 100644
> --- a/package/acpica/acpica.mk
> +++ b/package/acpica/acpica.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ACPICA_VERSION = 20191018
> +ACPICA_VERSION = 20200528
>  ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz

As per upstream:

    Important Note: The unix2 source package is deprecated since the
    dual-license is now included in all source modules (along with the
    Intel license). This package will be removed from future ACPICA
    releases.

So, what should we do with that?

Regards,
Yann E. MORIN.

>  ACPICA_SITE = https://acpica.org/sites/acpica/files
>  ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
