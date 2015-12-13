From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Dec 2015 23:30:25 +0100
Subject: [Buildroot] [PATCH] openvmtools: enable for uClibc toolchains
In-Reply-To: <20151213230145.765dd4a1@free-electrons.com>
References: <20151204165330.GA5268@waldemar-brodkorb.de>
 <20151213230145.765dd4a1@free-electrons.com>
Message-ID: <20151213223022.GS19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Fri, 4 Dec 2015 17:53:30 +0100, Waldemar Brodkorb wrote:
> > Since uClibc-ng 1.0.9 openvmtools can be compiled as
> > the missing euidaccess function was added.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/openvmtools/Config.in |    8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> Arnout explained very well that this patch is not super great due to
> the need to keep things working with older uClibc toolchains. Could you
> instead cook a patch that changes openvmtools to detect if euidaccess()
> is available or not. If it is available, then it uses it, otherwise, it
> open-codes it (the euidaccess implementation in uClibc is just one
> line, so it's not a big deal to copy that in the openvmtools source
> code).
> 
> Are you willing to implement such a solution?

Not sure it is worth. I am not using openvmtools on
embedded systems, so may be I just wait ;)
 
> I'd say that within 6/12 months, we should be able to kill non-ng
> uClibc support. Blackfin will be a problem... but Blackfin has always
> been a problem.

I recently done some testing with Blackfin. Latest binutils/gcc
development versions might be usable to get back an internal
toolchain support, whenever they make a new release. 
(speaking about binutils 2.26 and gcc 6).

best regards
 Waldemar
