From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 22:55:05 +0200
Subject: [Buildroot] [PATCH v3 4/4] package/rpm: add host variant
In-Reply-To: <CALe+oY8qrjgBwjXTHacFjwy=4LToG98PmrF4VjeCERSUcxVF4A@mail.gmail.com>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <1441293831-3524-4-git-send-email-james.knight@rockwellcollins.com>
 <20150903183516.GF3607@free.fr>
 <CALe+oY8qrjgBwjXTHacFjwy=4LToG98PmrF4VjeCERSUcxVF4A@mail.gmail.com>
Message-ID: <20150903205505.GG3607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-09-03 16:34 -0400, James Knight spake thusly:
> On Thu, Sep 3, 2015 at 2:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Same comment as for beecrypt: you do not need an intermediate variable,
> > just re-use the target variable when defining the host variable; [...]
> >
> >     RPM_CONF_OPTS = \
> >         --disable-largefile \
> >         --disable-rpath \
> >         [...]
> >
> >     HOST_RPM_CONF_OPTS = \
> >         $(RPM_CONF_OPTS) \
> >         --with-beecrypt \
> >         --without-archive \
> >         [...]
> 
> Question about this though, won't this be an issue for additional
> configuration values set later in the file (ie. options added to
> `RPM_CONF_OPTS`)?
> 
> When I clean up this patch and remove the intermediate variable, I
> assume I should be declaring the host options such as:
> 
>     HOST_RPM_CONF_OPTS := \
>         $(RPM_CONF_OPTS) \
>         --with-beecrypt \
>         --without-archive \
>         [...]
> 
> Unless I've missed something?

Nope, you're right. I missed the fact that additional configure flags
could be added to the target variant.

And following Arnout's comment, pleas keep the internediate variable.

However, I think it is mis-named. What about RPM_COMMON_CONF_OPTS ?
Ditto for beecrypt, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
