From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 09:23:37 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <523A23E0.4040602@mind.be>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
 <523A23E0.4040602@mind.be>
Message-ID: <CAAXf6LXtiSyVejwF_ZyW3qjzy8CS_n+0Xgj84MGFa-6kk+MggA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On Thu, Sep 19, 2013 at 12:06 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>
>  For the 'dynamic library' option, I don't think it's that important to add
> a comment for it. It's so exotic, and you probably select only very few
> packages in that case anyway, so the likelihood of someone encountering that
> situation is pretty slim.
>

Well, I think this depends on the semantics of PREFER_STATIC_LIB or
the way we will handle the dynamic library option(s) in the future. If
there is really an option that says 'I want static libs', then I think
it makes sense to add a comment, because it's a user choice. If the
linking is only based on the architecture supporting it or not, and
the user will get dynamic libs when supported, then a comment is not
needed.

Based on the discussion so far, I don't think we should try to fix the
situation in the context of this patchset, but rather in a separate
one. I would therefore propose, for this patchset, to keep the current
situation and the documentation as proposed in the patch. Later, any
needed changes can be made when the dynamic library handling is
cleared out. In the mean time, I will not add new comments for
packages that depend on !STATIC but do not yet have a comment, as this
may be wasted effort.

What do you think?

[..]
>
>
>  There is no scrolling in menuconfig, so just put "so that it will fit on a
> 80-character terminal".

Ok, thanks, will fix.

Best regards,
Thomas
