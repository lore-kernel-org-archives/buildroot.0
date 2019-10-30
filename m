From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Oct 2019 10:09:24 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page
 with minimal legal info
In-Reply-To: <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
References: <20191029095101.442578-1-mickael.tansorier@smile.fr>
 <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
Message-ID: <20191030090924.GB2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micka?l, Arnout, All,

Since this is the second iteration of the patch, next time please add a
'v2' in the title.

Also, add a post-commit changelog of changes between v1 and v2. The post
commit changelog is to be put after the '---' line:

    [PATCH v2] blabla: short title

    We do this and that, and not this

    Signed-off-by: You

    ---
    Changes v1 -> v2:
      - something changed
      - some other thing changed

On 2019-10-29 23:40 +0100, Arnout Vandecappelle spake thusly:
> On 29/10/2019 10:51, Micka?l Tansorier wrote:
> > `web-legal-info` depend on `legal-info`, because it use output
> > of legal info to generate html web page.
[--SNIP--]
> > +.PHONY: web-legal-info
> > +web-legal-info: legal-info
> 
>  I was going to suggest to put this directly into the legal-info target.
> However, since we no longer have a dependency on Python, we shouldn't rely on
> Python scripts in our "normal" path, so it's OK as is.

Well, this is not what we concluded during the devdays, and Thomas
already replied that we wanted to have this included in the existing
legal-info target. Also, the manual already states:

    http://nightly.buildroot.org/#requirement-optional

    Some features or utilities in Buildroot, like the legal-info, or
    the graph generation tools, have additional dependencies. Although
    they are not mandatory for a simple build, they are still highly
    recommended:

     * python (version 2.7 or any later)

So, I agree with Thomas that this should be included in legal-info, and
not a new separate target.

Also, have you had a look at Nicolas' alternate proposal, which is much
more lightweight and simple:
    http://lists.busybox.net/pipermail/buildroot/2019-October/264344.html

Basically, it justs creates an xml file from the csv, and when one opens
it in a browser, it is properly rendered thanks to the accompanying xsl
template. We don't want to make it too complex

[--SNIP--]
> > +# and folders:
> > +#   - `sources`
> > +#   - `host-sources`
> > +#
> > +# Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>
> 
>  Small nit: copyright statement should come before the rest.
> 
>  I would also like to this opportunity to start using SPDX license identifiers
> in our code. So it should start with
> 
> # SPDX-License-Identifier: GPL-2.0-or-later
> #
> # Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>

Such copyright identifiers are not required: the Berne Convention states
that the copyright is implicit, that is, a work does not have to carry a
copyright identifier to be properly copyrighted [https://en.wikipedia.org/wiki/Berne_Convention].

Also, as time passes, other contributors will modify this script. We do
not want to have a copyright identifier for each and every contribution
that will be made to this script. Especially since the git log keeps an
accurate authorship of all contributors.

So I would suggest we do add such new copyright identifiers, and get rid
of the existing ones (as time passes).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
