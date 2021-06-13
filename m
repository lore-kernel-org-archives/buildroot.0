From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jun 2021 09:14:56 +0200
Subject: [Buildroot] [PATCH 1/1] Allow users to specifiy a hash file to
 verify custom linux kernels and custom kernel headers
In-Reply-To: <20210612210627.GZ168928@scaer>
References: <BN8PR11MB3666996FFEB3B0DCA11CDD6CFF349@BN8PR11MB3666.namprd11.prod.outlook.com>
 <20210612210627.GZ168928@scaer>
Message-ID: <20210613091456.1e4edd9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jun 2021 23:06:27 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> However, I think this patch makes the feature really too-specific to
> just the kernel (and its headers). Instead, I think we will want
> something that can be used to check hashes for other packages where the
> version can be specified:

I totally agree with this, and wanted to reply the same to Ian's patch.

>     +config BR2_EXTRA_HASH_FILES
>     +	string "Paths to files containing extra packages hashes"
>     +	help
>     +	  Set to a space-separated list of file paths to use to check
>     +	  packages hashes against.

However, I am wondering if we shouldn't be doing something even more
generic.

We already have the BR2_GLOBAL_PATCH_DIRECTORIES option to add custom
patches to package.

Here we have a proposal to address the case of hash files for those
packages where a custom version can be specified. But for such
packages, we also have other aspects that are not nicely handled today:

 * The license files + their hashes.

 * The CPE ID information, as the version of such packages (typically
   some random Git commit or tag) doesn't allow proper matching with
   the CPE database version.

Shouldn't we have these requirements in mind as well when trying to
come up with a solution ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
