From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:42:05 +0200
Subject: [Buildroot] [PATCH 00/13] perl modules again
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180912234205.3db0a5c8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Mon, 20 Aug 2018 04:55:01 -0700, Christopher McCrory wrote:

> Christopher McCrory (18):
>   perl-dbi: add host package
>   perl-dbd-mysql: new package
>   perl-data-dump: new package
>   perl-time-parsedate: new package
>   perl-x10: new package
>   perl-sys-cpu: new package
>   perl-dist-checkconflicts: new package
>   perl-package-stash: new package
>   perl-class-load: new package

So up to this point, I have applied the patches.

>   perl-template-toolkit: new package
>   perl-xml-parser: new package

Those two patches are pending a resolution on the discussion on whether
we really need to patch the Makefile in sub-directories, or if we can
have them properly generated.

If we need to patch them, I have suggested how to integrate this in the
pkg-perl infrastructure, and I would like this to be done and then used
by the packages.

>   perl-soap-wsdl: new package

On this one, there is the question of the dependency on
perl-termreadkey.

>   perl-time-parsedate: add license

This one is no longer needed, I marked as Superseded.

>   perl-termreadkey: new package

This one you said yourself does not cross-compile.

>   pkg-utils.mk: patch_sub_makefile
>   perl-template-toolkit: use new patch_sub_makefile
>   perl-xml-parser: use new patch_sub_makefile
>   perl-soap-wsdl: add dependancy on perl-termreadkey

So, I've marked all those remaining patches as Changes Requested.
Could you work on fixing the above issues, and send an updated version
of the patch series ? Or possibly separate patch series if there are
separate sets of packages with no inter dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
