From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jun 2018 19:13:03 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <CAOJ2eMeFnmAdFiiCePrAAh0tQQnk7L42VLN5MUy7CHitop2prw@mail.gmail.com>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
 <20180605161546.GE2503@scaer>
 <CALURroS4t3V6GWnZSs6GEcAFrf1=KvfU036dskH6aEM4fQXn8w@mail.gmail.com>
 <20180605165039.GA29058@scaer>
 <69845f53-8c5f-910a-58b2-57bf5c0e38e3@mind.be>
 <CAOJ2eMeFnmAdFiiCePrAAh0tQQnk7L42VLN5MUy7CHitop2prw@mail.gmail.com>
Message-ID: <20180608171303.GA2090@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, Arnout, All,

On 2018-06-08 14:40 +0300, Stefan Becker spake thusly:
> On Fri, Jun 8, 2018 at 12:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >  So, not whois, not busybox, not openssl... What about python, which we anyway
> > require to be installed on the host? I remember that someone has posted a
> > one-liner that would do the job :-P

Well, I'd still prefer we had a script, and especially I did not like
that it would read the random bytes from stdin, when python provides a
proper random abstraction:

    import os
    os.urandom(64) # 64 random bytes

This is even portable, using various backends on various OSes... Then
your previous proposal becomes acceptable. Now. ;-)

> Because a python one-liner is not enough. F.ex. from support/scripts/mkuser:
> 
>    # Encode a password
>    encode_password() {
>        local passwd="${1}"
> 
>        mkpasswd -m "${PASSWD_METHOD}" "${passwd}"
>    }

Well, that one is an internal script of oours (I wrote it), so we can
very well change it to use another tool without problem.

> i.e. you need at least a python script with mkpasswd-compatible
> command line parameters.

Ideally, a mkpasswd-compatible tool would be nice, but as long as we use
it internally, we don't care much, in fact.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
