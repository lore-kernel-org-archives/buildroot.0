From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Aug 2017 19:32:46 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: do not use deprecated
 -mfused-madd
In-Reply-To: <20170811080858.336ba4d3@windsurf>
References: <20170811052847.GA32348@waldemar-brodkorb.de>
 <20170811080858.336ba4d3@windsurf>
Message-ID: <20170811173246.GL28021@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 11 Aug 2017 07:28:48 +0200, Waldemar Brodkorb wrote:
> > GCC deprecated -mfused-madd, -ffp-contract=off should
> > be used for Xburst workaround.
> > uClibc compilations will fail, because a gcc warning
> > is emitted while checking for TLS support in the compiler.
> 
> In which gcc version was -ffp-contract=off added ? Can we use that
> unconditionally, or is it only available in recent gcc versions ?

It was added in commit b9be572eda05cd23bbabd6409387d2c7ac782715.

Not sure how to find when it was added in a release.
4.6.4 seems to have it:
https://gcc.gnu.org/onlinedocs/gcc-4.6.4/gcc/Optimize-Options.html#index-ffp_002dcontract-691

I don't find it in earlier release docs.

best regards
 Waldemar
