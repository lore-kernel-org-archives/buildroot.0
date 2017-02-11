From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Feb 2017 23:25:10 +0100
Subject: [Buildroot] [PATCH 6/6] support/test-pkg: print number of
 toolchain and progress
In-Reply-To: <CAAXf6LV74tYZUGmGDFmhMi=--1Rx-e_i7rMKw4f=mx-81OH46w@mail.gmail.com>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <aeb2ab98194fac3ad0a73727707023552624d52e.1486584734.git.yann.morin.1998@free.fr>
 <CAAXf6LV74tYZUGmGDFmhMi=--1Rx-e_i7rMKw4f=mx-81OH46w@mail.gmail.com>
Message-ID: <20170211222510.GF20146@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2017-02-11 21:09 +0100, Thomas De Schampheleire spake thusly:
> On Wed, Feb 8, 2017 at 9:15 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  support/scripts/test-pkg | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> > index e77c804..919200d 100755
> > --- a/support/scripts/test-pkg
> > +++ b/support/scripts/test-pkg
> > @@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
> >  main() {
> >      local o O opts
> >      local cfg dir pkg random url toolchain
> > -    local ret nb_dl nb_cfg nb_skip nb_clean nb_build
> > +    local ret nb nb_dl nb_cfg nb_skip nb_clean nb_build
> >      local -a toolchains
> >
> >      o='hc:d:p:r:t:'
> > @@ -71,13 +71,18 @@ main() {
> >          printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
> >      fi
> >
> > +    printf "Found %d toolchains\n" ${#toolchains[@]}
> > +
> > +    nb=1
> >      nb_dl=0
> >      nb_cfg=0
> >      nb_skip=0
> >      nb_clean=0
> >      nb_build=0
> >      for toolchain in "${toolchains[@]}"; do
> > +        printf "%40s [%3d/%3d]: " "$( basename "${toolchain}" .config)" ${nb} ${#toolchains[@]}
> 
> Do you expect more than 99 toolchains very soon?
> I know it's a nit, but the following does not look very nice IMHO: [  2/ 48]
> I would either use %2d for the counters, or alternatively:
> 
> nbfmt="%d"
> if [ ${#toolchains[@]} -gt 9 ]; then
>     nbfmt="%2d"
> elif [ ${#toolchains[@]} -gt 99 ]; then
>     nbfmt="%3d"
> fi
> 
> Regardless:
> 
> Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Thanks, but I eventually dropped that patch from the series. It does not
bring much in the end.

If people argue that it is better to keep it, I can re-instate it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
