From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 14 Feb 2017 10:00:40 +0100
Subject: [Buildroot] [PATCH] openswan: fix autobuild failures with
 uClibc-ng
In-Reply-To: <20170213225416.73d2521f@free-electrons.com>
References: <20170213213045.GA13499@waldemar-brodkorb.de>
 <20170213225416.73d2521f@free-electrons.com>
Message-ID: <20170214090040.GC12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Mon, 13 Feb 2017 22:30:45 +0100, Waldemar Brodkorb wrote:
> > Add patch to fix following autobuild failures:
> > 
> > Fixes:
> >   http://autobuild.buildroot.net/results/31cf680c48bec8ba4450a6fe2156cb441c4dd660
> >   http://autobuild.buildroot.net/results/95220f231810cb12ba97a6b44af79f84af706c82
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  .../0001-uClibc-ng-is-compatible-to-glibc.patch    | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch
> 
> Thanks for the patch. While it is nice to fix this warning, there are
> plenty of other warnings spit out by the openswan build process. I
> believe the real thing to fix is the usage of -Werror by openswan.
> Maybe passing WERROR=' ' on the command line is enough?

But the warning is wrong in case of uClibc-ng, because the symbol is
removed for a while and malloc(0) is compatible to glibc behaviour.
Furthermore it is the only warning with breaks the compilation with
-Werror. So at the moment this should be enough. Maybe -Werror can
be disabled in a second patch later, if any trouble occurs.

best regards
 Waldemar
