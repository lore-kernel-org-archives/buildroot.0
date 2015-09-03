From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 3 Sep 2015 16:34:26 -0400
Subject: [Buildroot] [PATCH v3 4/4] package/rpm: add host variant
In-Reply-To: <20150903183516.GF3607@free.fr>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <1441293831-3524-4-git-send-email-james.knight@rockwellcollins.com>
 <20150903183516.GF3607@free.fr>
Message-ID: <CALe+oY8qrjgBwjXTHacFjwy=4LToG98PmrF4VjeCERSUcxVF4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks; and sorry for all these little mistakes.

On Thu, Sep 3, 2015 at 2:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Same comment as for beecrypt: you do not need an intermediate variable,
> just re-use the target variable when defining the host variable; [...]
>
>     RPM_CONF_OPTS = \
>         --disable-largefile \
>         --disable-rpath \
>         [...]
>
>     HOST_RPM_CONF_OPTS = \
>         $(RPM_CONF_OPTS) \
>         --with-beecrypt \
>         --without-archive \
>         [...]

Question about this though, won't this be an issue for additional
configuration values set later in the file (ie. options added to
`RPM_CONF_OPTS`)?

When I clean up this patch and remove the intermediate variable, I
assume I should be declaring the host options such as:

    HOST_RPM_CONF_OPTS := \
        $(RPM_CONF_OPTS) \
        --with-beecrypt \
        --without-archive \
        [...]

Unless I've missed something?
