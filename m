From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Mar 2018 17:16:05 +0100
Subject: [Buildroot] [PATCH 1/2] core/intrumetnation: don't spawn to get
 seconds-since-EPOCH
In-Reply-To: <CABa6e=qZfehqQHFAkutn-WaFAw6Gp3Za-3_3ZB6mXd1ukxZq7w@mail.gmail.com>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <ef3b9c4c1ca910423b06f1374ee9461c77aaeed1.1521146096.git.yann.morin.1998@free.fr>
 <CABa6e=qZfehqQHFAkutn-WaFAw6Gp3Za-3_3ZB6mXd1ukxZq7w@mail.gmail.com>
Message-ID: <20180318161605.GB2478@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On 2018-03-17 22:54 +1100, Cam Hutchison spake thusly:
> On 16 March 2018 at 07:35, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > No need to spawn $(date) to get the number of seconds-since-EPOCH, as
> > bash's printf can do it as easily.
> >
> > This is just a micro-optimisation, though. Probably not noticeable.
> >
> > Reported-by: Trent Piepho <tpiepho@impinj.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Trent Piepho <tpiepho@impinj.com>
> > ---
> >  package/pkg-generic.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 9eddaeee57..2a82025a04 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -49,8 +49,8 @@ endef
> >
> >  # Time steps
> >  define step_time
> > -       printf "%s:%-5.5s:%-20.20s: %s\n"           \
> > -              "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
> > +       printf "%(%s)T:%-5.5s:%-20.20s: %s\n"           \
> > +              -1 "$(1)" "$(2)" "$(3)"  \
> 
> Should you note somewhere that this needs bash 4.2? I remember some
> re-working of bash patches in the past to avoid the use of associative arrays
> as they were not supported in the oldest version of bash supported by
> buildroot. Is bash 4.2 ok now?
> 
> See http://tiswww.case.edu/php/chet/bash/NEWS for when features were
> added to bash.

OK, I'm dropping this change, then. Thanks for noticing. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
