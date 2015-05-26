From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 26 May 2015 12:10:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: add patch to fix host
 build error with gcc 5.1
In-Reply-To: <20150526095730.GQ2260@tarshish>
References: <1432634015-24079-1-git-send-email-joerg.krause@embedded.rocks>
 <20150526095730.GQ2260@tarshish>
Message-ID: <1432635054.24186.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Di, 2015-05-26 at 12:57 +0300, Baruch Siach wrote:
> Hi J?rg,
> 
> On Tue, May 26, 2015 at 11:53:35AM +0200, J?rg Krause wrote:
> > diff --git a/package/mtd/0005-Fix-redefinition-build-error.patch 
> > b/package/mtd/0005-Fix-redefinition-build-error.patch
> > new file mode 100644
> > index 0000000..b29c3a5
> > --- /dev/null
> > +++ b/package/mtd/0005-Fix-redefinition-build-error.patch
> > @@ -0,0 +1,70 @@
> > +From d00e6c6d623485ced942a018dc9b06a52c8f90e4 Mon Sep 17 00:00:00 
> > 2001
> > +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> > +Date: Mon, 25 May 2015 16:37:27 +0200
> > +Subject: [PATCH 1/1] Fix redefinition build error
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Building host-mtd with C11 (default for gcc 5.1) fails with:
> > +  error: redefinition of ?hashtable_iterator_key?
> > +  error: redefinition of ?hashtable_iterator_value?
> > +
> > +These two functions are defined both in the header and the C 
> > source file.
> > +Fix this by removing the definition in the C source file and 
> > convert the
> > +"extern inline" to "static inline" in the header file.
> > +
> > +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> What is the upstream status of this patch?

Good question! I've seen now that Bernard Walle submitted the same
patch three weeks ago to the mtd mailing list [1]. No feedback so far.

[1]
https://patchwork.ozlabs.org/patch/467254/
