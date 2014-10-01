From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 1 Oct 2014 21:58:56 +0200
Subject: [Buildroot] [PATCH 14/25 v6] docs/manual: allow documents to
 define some hooks, as for a package
In-Reply-To: <a743d5b27ae9337150c1497523aa11f16b9f9c58.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <a743d5b27ae9337150c1497523aa11f16b9f9c58.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXWJBVYN=hx3=5hnqtAiPvSMd=btGTnF2pevA4aY5bbpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Allow documents to define two hooks:
>   - DOC_CHECK_EXTRA_DEPENDENCIES_HOOKS
>     to check for extra dependencies required by this document
>   - DOC_CHECK_EXTRA_DEPENDENCIES_FMT_HOOKS
>     ditto, but for the specific format
>   - DOC_POST_EXTRACT_HOOKS:
>     to run additional actions to fill-in the build directory
>
> (Replace 'DOC' with the uppercase name of the document, and 'FMT' with
> the format.)
>
> This is supposed to replace the current use of overloading the internal
> dependency rules, and makes GENDOC behave yet a bit more like the
> package infrastructure.
>
> Note that GENDOC_INNER already has the uppercase name as an argument,
> whereas GENDOC does not, so the two foreach loops are not exactly
> similar (for now.)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes v5 -> v6:
>   - do not use $$ for call to UPPERCASE  (Thomas DS)
>

Here the same misunderstanding occurred. In these cases, I do think $$
should be used.

If the resulting patch is the same as v5, my Ack on that still counts.
