From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 21 Aug 2019 18:05:34 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ghostscript: fix static
 build errors
References: <20190818101406.6574-1-bernd.kuhls@t-online.de>
 <20190819145008.7fb17234@windsurf.home>
Message-ID: <en603gxs9n.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 19 Aug 2019 14:50:08 +0200 schrieb Thomas Petazzoni:

> There are plenty of other places besides those two fontconfig/freetype
> cases where PKGCONFIG --libs gets used. Why aren't these other places
> also a problem ? What is the actual problem ?

Hi,

upstream responded to my patch and will need more time to investigate: 
https://bugs.ghostscript.com/show_bug.cgi?id=701439#c2

I think the genconf binary, built for the host, has problems dealing with 
the output of PKGCONFIG --libs, using --libs-only-l was just a hack to 
demonstrate that the problem is with genconf and not with configure/make.

For someone like me unfamiliar with the internals of the ghostscript 
build system I prefer to wait for upstream fixing the bug so marking 
http://patchwork.ozlabs.org/patch/1148830/ with "Changes requested" is ok.

But I reopened http://patchwork.ozlabs.org/patch/1148831/ because this 
patch fixes a CVE unrelated to the build problem.

Regards, Bernd
