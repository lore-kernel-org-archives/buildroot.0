From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Thu, 19 Apr 2018 07:50:23 +0000
Subject: [Buildroot] [PATCH 2/3] dropbear: Add configuration options for
 security features
In-Reply-To: <20180418171031.013dbdac@windsurf.numericable.fr>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
 <20180418142434.7268-2-stefan.sorensen@spectralink.com>
 <20180418171031.013dbdac@windsurf.numericable.fr>
Message-ID: <195f462199a4024a7e93852cdf2327532e42269e.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Sorry for the double email Thomas, forgot to CC the list]

On Wed, 2018-04-18 at 17:10 +0200, Thomas Petazzoni wrote:

> We received PATCH 2/3 and 3/3, but not 1/3. Was it sent ? Is it a
> mistake ?

It is in patchwork: https://patchwork.ozlabs.org/patch/900310/

> 
> > +config BR2_PACKAGE_DROPBEAR_CIPHER_BLOWFISH
> > +   bool "Blowfish"
> > +   default y       if !BR2_PACKAGE_DROPBEAR_SMALL
> 
> No need for a tab before the "if".
> 
> Is it possible to enable this option even if
> BR2_PACKAGE_DROPBEAR_SMALL=y ? I.e, does it build ?

Yes, the selection of small code and ciphers are completely orthogonal.

> Did you do a pass with ./utils/check-package on package/dropbear/*
> after doing those changes ?

I did, not errors/warnings.

Stefan
