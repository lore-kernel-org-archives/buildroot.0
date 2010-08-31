From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 31 Aug 2010 22:25:02 +0000 (UTC)
Subject: [Buildroot] Debug symbols in staging, but stripped on target?
References: <i5jq5c$s5d$1@dough.gmane.org>
Message-ID: <i5jvfu$j4d$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-31, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> I need to do some debugging of a package's application, so I need
> debugging symbols enabled for that package.
>
> The only option I can find that appears related is
>
>   BR2_ENABLE_DEBUG
>
> There are a couple issues with that:
>
>  1) It enables debug symbols for all packages, and I only want them
>     for one.
>
>  2) It apprently disables stripping of target executables.  I don't
>     have room (nor any use) for debugging symbols on the target -- I
>     only need them on the development host (e.g. in the staging
>     directory).

My current work-around is to get rid of the BR2_ENABLE_DEBUG
dependancy in the BR2_STRIP_xxxxx choices.

That way I can enable BR2_ENABLE_DEBUG and still have stripped
binaries on the target.

[I don't really understand why the two were connected like that, they
seem to me to be orthogonal choices.]

-- 
Grant Edwards               grant.b.edwards        Yow! I Know A Joke!!
                                  at               
                              gmail.com            
