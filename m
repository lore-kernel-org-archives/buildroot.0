From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 21:57:07 +0200
Subject: [Buildroot] [PATCH 10/23 v5] docs/manual: do not hardcode name
 of the generated document
In-Reply-To: <7b0fc250f94242ca764f011219f817f16afa5f67.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <7b0fc250f94242ca764f011219f817f16afa5f67.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+=fb=w22qzrieo2a4a7eC3UFpLNKKzResMOKrzoC8qYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, GENDOC_INNER har-codes some variables to have the name of the

s/har-codes/hard-codes/

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
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

With the aformentioned typo fixed, you can add:
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
