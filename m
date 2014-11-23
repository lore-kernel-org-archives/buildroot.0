From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 18:25:18 +0100
Subject: [Buildroot] [PATCH 0/4] pkg-infra: differentiate remote and
 local tarball filenames (branch yem/download)
In-Reply-To: <20141118220357.74bc954c@free-electrons.com>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
 <20141116122210.6b3651e0@free-electrons.com>
 <546BAE62.2020606@mind.be>
 <20141118220357.74bc954c@free-electrons.com>
Message-ID: <20141123172518.GD11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-18 22:03 +0100, Thomas Petazzoni spake thusly:
> Dear Arnout Vandecappelle,
> 
> On Tue, 18 Nov 2014 21:38:58 +0100, Arnout Vandecappelle wrote:
> 
> >  I think there are two reasons for the split:
> > 
> > 1. _SOURCE can be dropped if it is <pkg>-<version>.tar.gz - this would be
> > difficult if we only had _SITE.
> 
> True. But on the other hand, the fact that we use
> <pkg>-<version>.tar.gz by default has always confused newcomers a bit,
> and with .tar.xz becoming more and more adopted, having .tar.gz as the
> default is less obvious than it used to be.
> 
> > 2. _PATH and _EXTRA_DOWNLOAD don't need to specify the full URL.
> 
> Well, yes, but that's specifically the issue I raised: since you don't
> specify the full URL, there's no way for the package to download
> patches or other stuff from other places than <pkg>_SITE.

Well, I still find the split worthwhile.

Still, we could allow FOO_EXTRA_DOWNLOADS and FOO_PATCH to be
fully-qualified URIs. If they are not, prepend FOO_SITE to generate a
full URI.

Yes, I am writing a package that will download most of its files via
_EXTRA_DOWNLOADS (don't ask why, upstream is not doing release tarballs
for that component), and it would be *very* cumbersome to repeat the
_SITE for all of those files.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
