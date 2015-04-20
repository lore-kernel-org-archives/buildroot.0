From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2015 19:32:19 +0200
Subject: [Buildroot] [PATCH 2/3] manual: cvs: document that a date can
 be used instead of a tag
In-Reply-To: <CAHkwnC-mOAdrGEt0E_FCrvf2kFZJ78UuWa+2h0a+Dco8dg49uA@mail.gmail.com>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
 <1429376067-9228-3-git-send-email-fabio.porcedda@gmail.com>
 <20150419081028.GB4313@free.fr>
 <CAHkwnC-mOAdrGEt0E_FCrvf2kFZJ78UuWa+2h0a+Dco8dg49uA@mail.gmail.com>
Message-ID: <20150420173219.GA4057@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-04-19 12:08 +0200, Fabio Porcedda spake thusly:
> On Sun, Apr 19, 2015 at 10:10 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2015-04-18 18:54 +0200, Fabio Porcedda spake thusly:
[--SNIP--]
> >> -     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a timestamp.
> >> +     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a tag or a date.
> >
> > I'd like we document the format of the date we recognise. Because, IIRC,
> > cvs accepts 'yesterday' as a date format, and that would be interpreted
> > as a tag with the current code.
> >
> > So maybe, just state something like:
> >
> >     ... or a date (YYYYMMDD:hhmmss)
> 
> What about this:
> (<YYYY>-<MM>-<DD>[T<HH><MM>[<SS>]] e.g 2015-12-20 or 2015-12-20T1010)

Well, this is exactly RFC3339;
    https://tools.ietf.org/html/rfc3339#section-5.8

So we may just state smehing along the lines of:

    ... or a date (formatted as defined in
    https://tools.ietf.org/html/rfc3339[RFC 3339]).

But I'd have to agree that it is not user-friendly, so we still want a
complete example, like so:

    ... or a date (formatted as defined in https://tools.ietf.org/html/rfc3339[RFC 3339],
    like <YYYY>-<MM>-<DD>[T<HH>:<MM>[:<SS>[.sss]]] e.g 2015-12-20 or 2015-12-20T10:10 or
    even 2015-12-20T16:42:12.467923; for complet ereference, see the
    http://sunsite.ualberta.ca/Documentation/Gnu/cvs-1.12.11/cvs.html#Date-input-formats[CVS
    manual]).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
