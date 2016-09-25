From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Sep 2016 19:32:02 +0200
Subject: [Buildroot] [PATCH 01/10] core: do not hard-code inclusion of
 br2-external in Kconfig
In-Reply-To: <1a24bc3d-bbfc-95aa-5f1f-904b695000cc@gmail.com>
References: <cover.1474815151.git.yann.morin.1998@free.fr>
 <ada7b8d92f513d7a94c4f4d925fd1d889b7204ec.1474815151.git.yann.morin.1998@free.fr>
 <1a24bc3d-bbfc-95aa-5f1f-904b695000cc@gmail.com>
Message-ID: <20160925173202.GA3396@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-09-25 19:21 +0200, Romain Naour spake thusly:
> Le 25/09/2016 ? 16:52, Yann E. MORIN a ?crit :
> > Move the inclusion of br2-external's Config.in to the generated kconfig
> > snippet.
> > 
> > This will ultimately allow us to use more than one br2-external tree.
> > 
> > Offload the "User-provided options" menu to the generated Kconfig
> > snippet. We can also move the definition of the Kconfig-version of
> > BR2_EXTERNAL into this snippet.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> > diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> > new file mode 100755
> > index 0000000..c15c21c
> > --- /dev/null
> > +++ b/support/scripts/br2-external
> > @@ -0,0 +1,85 @@
> > +#!/bin/bash
> > +set -e
[--SNIP--]
> > +# Validates the br2-external tree passed as argument. Makes it cannonical
> > +# and store it in global variable BR2_EXT.
> > +do_validate() {
> > +    local br2_ext="${1}"
> > +
> > +    if [ ! -d "${br2_ext}" ]; then
> > +        error "'%s': no such file or directory\n" "${br2_ext}"
> > +    fi
> > +
> > +    BR2_EXT="$(cd "${br2_ext}"; pwd -P )"
> 
> br2_ext can be a directory on which we may not have access, so cd will fail here.

You really want to find a reason for me to respin this series so it gets
in patchwork, don't you? ;-)

Indeed, that would return Buildroot's top directory, which is not
correct.

Thanks for noticing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
