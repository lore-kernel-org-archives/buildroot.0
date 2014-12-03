From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Dec 2014 20:04:59 +0100
Subject: [Buildroot] [PATCH] binutils: Add user support for fetching
 from git.
In-Reply-To: <cf100033200a99097708adfd4f4c065b5e6fbe3b.1416611974.git.andrew.burgess@embecosm.com>
References: <cover.1416611974.git.andrew.burgess@embecosm.com>
 <cf100033200a99097708adfd4f4c065b5e6fbe3b.1416611974.git.andrew.burgess@embecosm.com>
Message-ID: <20141203190459.GH4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On 2014-11-21 23:32 +0000, Andrew Burgess spake thusly:
> This change adds a new option "from git repository" to the list of
> available binutils versions.  Selecting this allows the user to input
> the URL of a git repository, and the version to use from the
> repository.
> 
> The ARC target, which previously was hard coding a git URL and version
> into binutils.mk switches to this new scheme, moving the URL and
> version into Config.in.host.

Thank you for your contribution, and sorry for the delay in answering.

The fact that we need a git revision for arc is just happenstance, we
could well point to a tarball of that tag instead of getting it from
git; we do not use a tarball because none is available to our knowledge,
and thus we have to use the git tree.

However, this is creating an imbalance between binutils and gcc/glibc/...
and basically all other packages (except very few critical ones) for
which we do not offer a choice to use a random git tree or commit.

Moreover, we believe this situation is better served by using the
_OVERRIDE_SRCDIR feature, see:
    http://nightly.buildroot.org/#_advanced_usage

    8.11.6. Using Buildroot during development

    [...] Buildroot provides a specific mechanism for this use case: the
    <pkg>_OVERRIDE_SRCDIR mechanism. Buildroot reads an override file,
    which allows the user to tell Buildroot the location of the source
    for certain packages.

In this case, you would have to provide:

    HOST_BINUTILS_OVERRIDE_SRCDIR=/path/to/your/arc-binutils

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
