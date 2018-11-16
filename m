From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Nov 2018 20:38:25 +0100
Subject: [Buildroot] [PATCH] support/dependencies: add a check for a
 suitable gzip
In-Reply-To: <20181116163252.25ff7342@windsurf>
References: <20181116152719.24591-1-yann.morin.1998@free.fr>
 <20181116163252.25ff7342@windsurf>
Message-ID: <20181116193825.GU10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-16 16:32 +0100, Thomas Petazzoni spake thusly:
> On Fri, 16 Nov 2018 16:27:19 +0100, Yann E. MORIN wrote:
> > Recently, some hash mismatch have been reported, both by users as well
> > as autobuilder failures, about tarballs generated from git repositories.
> > 
> > This turned out to be caused by users having the 'gzip' command somehow
> > aliased to 'pigz' (which stand for: parallel implementation of gzip,
> > which takes advantage of multi-processor system to parallelise the
> > compression).
> > 
> > Unfortunately, the output of pigz-compressed archives differ from that
> > of gzip (even though they *are* valid gzip-compressed streams).
> > 
> > Add a dependency check that ensures that gzip is not pigz. If that is
> > the case, bail out and refuse to build.
> > 
> > This is a stop-gap measure in preparation of the release. A complete
> > solution would accept pigz as a decompressor (because that is totally
> > OK), and ensure that we do build a host-gzip package should that be
> > needed. This is a much bigger endeavour, so this simple solution is
> > deemed enough for the release (after all, use of pigz is just atypical
> > enough that it should not pose such a problem for users to reverti to
> > using plain gzip).
> 
> Is it really that more complicated to add and use host-gzip ?

We need to add an actual host-gzip package, then ensure it is used when
needed (e.g. in _DOWNLOAD_DEPENDENCIES of git/svn/cvs based packages).

Definitiely not overly complex as I stated, no, but I was mostly looking
through the release-incoming prism, with a goal to do the strict minimum
to fail in a sane way, and was seeing the host-gzip as too far reaching
for the release.

But I can do that if you prefer.

> (This is a real question, not one asked with some irony.)

;-)

Even then, I can stomach a bit of irony. Even if I am very often
incapable of noticing it. :-]

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
