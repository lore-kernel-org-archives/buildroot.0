From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 3 Oct 2014 21:30:19 +0200
Subject: [Buildroot] [PATCH 09/25 v7] docs/manual: do not hardcode name
 of the generated document
In-Reply-To: <2de04679865aba8d9ec62795295534b42200868b.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
 <2de04679865aba8d9ec62795295534b42200868b.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVhgscrBeOMYf3+yRdW_J4RNhxihffaEe9Kkb3pR+MNRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 3, 2014 at 7:01 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, GENDOC_INNER hard-codes some variables to have the name of the
> document in them:
>     MANUAL_$(2)_ASCIIDOC_CONF
>     MANUAL_$(2)_ASCIIDOC_OPTS
>     MANUAL_$(2)_A2X_OPTS
>     MANUAL_$(2)_INSTALL_CMDS
>     ...
>
> Also, it defines some dependency on the generation rule, onto:
>     manual-check-dependencies
>     manual-check-dependencies-$(3)
>     manual-prepare-sources
>
> This is problematic, as it is not possible to have another document
> generated with the GENDOC infra, or it would trigger the rules, and use
> the variables for our own document, 'manual'.
>
> Add a new argument to GENDOC_INNER to be the uppercase name of the
> document, much like it is done for the PKG_*_INNER functions. Replace
> any reference to 'manual' with the currently passed named of the current
> document, $(1).
>
> The remaining references to 'manual' are on purpose, as they really
> pertain to our manual.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
