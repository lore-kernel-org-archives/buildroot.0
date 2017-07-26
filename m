From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Jul 2017 17:34:44 +0300
Subject: [Buildroot] [PATCH] tcpdump: security bump to 4.9.1
In-Reply-To: <20170726094104.GL26551@argentina>
References: <20170726094104.GL26551@argentina>
Message-ID: <20170726143444.7twdcsyvu4wlomaj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 26, 2017 at 11:41:04AM +0200, Thomas De Schampheleire wrote:
> Fixes CVE-2017-11108/Fix bounds checking for STP
> 
> Changelog: http://www.tcpdump.org/tcpdump-changes.txt
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> 
> Could someone please double-check the hash? I checked the PGP key but do not
> have the full trust mechanism so cannot be sure that the server public key is
> valid.

I verified both the hash and the signature.

>  package/tcpdump/tcpdump.hash | 2 +-
>  package/tcpdump/tcpdump.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
> index 966db1f3aa..ecd02275fe 100644
> --- a/package/tcpdump/tcpdump.hash
> +++ b/package/tcpdump/tcpdump.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature

It would be nice to add the URL of the signature here:

http://www.tcpdump.org/release/tcpdump-4.9.1.tar.gz.sig

> -sha256 eae98121cbb1c9adbedd9a777bf2eae9fa1c1c676424a54740311c8abcee5a5e  tcpdump-4.9.0.tar.gz
> +sha256 f9448cf4deb2049acf713655c736342662e652ef40dbe0a8f6f8d5b9ce5bd8f3  tcpdump-4.9.1.tar.gz

A hash of the license file would also be nice.

> diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
> index 0e779a53c3..8349748ceb 100644
> --- a/package/tcpdump/tcpdump.mk
> +++ b/package/tcpdump/tcpdump.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TCPDUMP_VERSION = 4.9.0
> +TCPDUMP_VERSION = 4.9.1
>  TCPDUMP_SITE = http://www.tcpdump.org/release
>  TCPDUMP_LICENSE = BSD-3-Clause
>  TCPDUMP_LICENSE_FILES = LICENSE

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
