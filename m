From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:21:28 +0200
Subject: [Buildroot] [PATCH 0/23 v5] gendoc infra: make it useable for
 other documents (branch yem/manual)
In-Reply-To: <cover.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <20140914112128.GB3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Gee... I forgot to update the series description in the cover letter.
Sorry... :-(

Here it is:

On 2014-09-14 13:07 +0200, Yann E. MORIN spake thusly:
> This series builds up on top of Samuel previous series, and further
> enhances the GENDOC infrastructure to be useable to generate other
> documents, and especially documents in br2-external.
> 
> The series is articulated as thus:
> 
>   - patches 1-4 from Samuel, virtually untouched by me, save for the
>     check for xsltproc, see the changelog in patch 4;

Unchanged from previous iteration.

>   - then, patches 5-16 to remove hard-coded reference to 'manual'
>     in either GENDOC or GENDOC_INNER, and to remove hard-coded paths to
>     our manual, and to properly separate GENDOC generic rules from
>     document-specific rules, and make GENDOC look more like the
>     pkg-XXX infrastructures;

Replaced with:

  - patches 5-14: properly separate our manual defintion from the actual
    infrastructure;

  - patches 15-16: make the gendoc infra behave more like the pkg
    infras, by using hooks rather than extra rules;

  - patch 17: workaround asciidoc deficiency when calling filters;

  - patches 18-19: move and rename 'gendoc' to 'doc-asciidoc';

  - patches 20-21: further tweak the new infra so it looks more like
    other infras: only call pkgdir and pkgname from the frontend macro,
    and use stamp files so we can use $(@D);

  - patch 22: allow using doc-asciidoc from br2-external;

  - patch 23: document this new infra in the manual.

Here is an example of using this new infra from a br2-external tree:

    http://ymorin.is-a-geek.org/download/tmp/br.config/brsh-manual.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
