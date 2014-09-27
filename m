From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 27 Sep 2014 13:20:30 +0200
Subject: [Buildroot] [PATCH 11/25 v6] docs/manual: last pass at removing
 hard-coded path in GENDOC_INNER
In-Reply-To: <abf6ea91d14165922844580992ac06af12628bfa.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <abf6ea91d14165922844580992ac06af12628bfa.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJCa=FGFLZhauT5aiFs2j89jv0c6H7-MMo8iX_HAMcKVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> GENDOC_INNER still has one hard-coded path to the document's directory:
> the asciidoc .conf files.
>
> Add a new argument to GENDOC_INNER to pass the directory of the
> document.
>
> Notes:
>
> - this makes for overly-long lines, but splitting is not possible,
> otherwise the first argument on the continuation line would get (at
> least) a leading space or tab, and that would break either or all of
> the variables names, the dependency rules, or the filenames we look
> for. A future patch will further clean this up (see: docs/asciidoc: call
> $(pkgname) and $(pkgdir) in a single place.)
>
> - this means that another document would be missing our tweaks from
> asciidoc-text.conf to not render images and sanely render hyperlinks.
> But that was already the case anyway, since we were using docs/$(1)/ to
> search for that file. A further patch will allow us to have such
> configuration in a common place.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>


-- 
Samuel
