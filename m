From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Oct 2017 18:25:19 +0200
Subject: [Buildroot] [PATCH v3 0/7] glibc: bump to 2.26
In-Reply-To: <e2bc3587-ca5e-9aef-752e-3902abe1624d@mind.be>
References: <20170923212414.16744-1-romain.naour@gmail.com>
 <e2bc3587-ca5e-9aef-752e-3902abe1624d@mind.be>
Message-ID: <20171016162519.GC2862@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-27 23:12 +0200, Arnout Vandecappelle spake thusly:
> On 23-09-17 23:23, Romain Naour wrote:
> > Let's hope that glibc 2.26.1 will be released soon :)
> 
>  As discussed on IRC:
> 
>  Apparently there won't be a glibc 2.26.1. It's up to distros to pick a git
> commit to release.

Yep, this is just silly... :-(

> So we have the choice to either keep a lot of patches in
> Buildroot, or use a git download instead of a tarball. The latter has the
> disadvantage of having a silly version "number" (the sha1), and that git
> downloads are generally much slower.

If we want a slightly less-silly-looking version, we could use something
like:

    glibc-2.26-43-gfdf58eb

whichh means the sha1 'fdf58eb' that is '43' commits after the 'glibc-2.26'
tag. But we have to be careful about shortening the sha1, to avoid
collisions. I would say that we stay with the full sha1.

It is pretty easy to generate such a version string:

    git describe --match 'glibc-*' --abbrev=12 origin/release/2.26/master

>  For now, we have those 6 patches in Buildroot. This may change in the future.

I would say that we should switch to using the 2.26/master branch from
upstream, because we don;t have the bandwidth to assess whether we
need/want to backport individual patches.

If upstream commits on the maintenance branch, it means that it is a
fix. And we want fixes, whatever they fix: functionality or security.

So I'd say we should switch to git. The repo is even accessible through
https (although it is not documented): https://sourceware.org/git/glibc.git

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
