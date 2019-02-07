From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Feb 2019 22:41:08 +0100
Subject: [Buildroot] [PATCHv2 1/1] package/libcurl: introduce options to
 reduce feature set
In-Reply-To: <20190207205510.11172-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Thu, 7 Feb 2019 21:55:09 +0100")
References: <20190207205510.11172-1-patrickdepinguin@gmail.com>
Message-ID: <87mun71dl7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Libcurl is more than 250 KiB (libcurl) / 100 KiB (curl binary) in size.
 > About 50 KiB / 15 KiB of this can be saved by disabling features/protocols
 > that are not commonly needed:

 > - proxy support: 15 KiB
 > - cookies support: 10 KiB
 > - various less common protocols: 25 KiB (libcurl) + 15 KiB (curl binary)

 > Note that the exact amount of space saved depends on the architecture,
 > toolchain, and other factors (for example the 'reduced' set disables the
 > --libcurl option which only has impact on the curl binary).

 > Other packages that are selecting libcurl could be incompatible with these
 > reduced options. But, there is no clear way to find out which packages are in
 > this situation, in particular because issues may only be visible at runtime.

That is not really nice :/

 > +config BR2_PACKAGE_LIBCURL_SMALL
 > +	bool "reduced protocol/feature selection"

I know I proposed this option myself, but having a negative option like
this is not really nice. What should a package that needs libcurl built
without the _SMALL option do? Depending on !BR2_PACKAGE_LIBCURL_SMALL
isn't really nice.

Could we perhaps invert the option and call it BR2_PACKAGE_LIBCURL_EXTRA or
something like that? (with default y)

-- 
Bye, Peter Korsgaard
