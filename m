From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 21 Apr 2014 13:56:07 +0200
Subject: [Buildroot] [PATCH 1/2] smack: new package.
In-Reply-To: <20140421121901.743513ef@skate>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140421121901.743513ef@skate>
Message-ID: <20140421115606.GA4082@milhouse>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Apr 21, 2014 at 12:19:01PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Sun, 20 Apr 2014 20:54:03 +0200, Eric Le Bihan wrote:
>
> > diff --git a/package/smack/Config.in b/package/smack/Config.in
> > new file mode 100644
> > index 0000000..971b79a
> > --- /dev/null
> > +++ b/package/smack/Config.in
> > @@ -0,0 +1,28 @@
> > +config BR2_PACKAGE_SMACK
> > +	bool "smack"
>
> Dependency on !BR2_PREFER_STATIC_LIB was missing, due to <dlfcn.h>
> usage. Remember to build test your packages with
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-linux-uclibc.config
> (to test !MMU) and
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config
> (to test !MMU and BR2_PREFER_STATIC_LIB).
Thanks for the polishing! Wouldn't it be useful to add a stanza in the
docs/manual/contribute.txt about performing some compliancy tests using these
two configurations before submitting new packages? Are there any other
criteria that could fit compliancy tests/checklist?

Best regards,
ELB
