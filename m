From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Feb 2016 23:33:44 +0100
Subject: [Buildroot] pjsip package status
In-Reply-To: <841623823.459573.1456179714125.JavaMail.zimbra@savoirfairelinux.com>
References: <1914178697.329791.1455739489770.JavaMail.zimbra@savoirfairelinux.com>
 <20160220173543.GE3418@free.fr>
 <841623823.459573.1456179714125.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20160222223344.GA3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2016-02-22 17:21 -0500, Patrick Keroulas spake thusly:
> Sure I can take a look at this but my BR experience is quite limited.
> Not sure about gsm, srtp, and portaudio. Why aren't they treated like
> other options?  Are you sure they're necessary for Asterisk application?

Well, I was mostly pointing you to this branch so you can look at the
pjsip package (since that was your inquiry).

I am not sure what you meant by "treated like other options". Some of
the features in Asterisk have dependencies on other packages (like srtp
for example), while others use internal code (like gsm for example).

No, they are not _strictly_ required for Asterisk to behave. Asterisk
can be an IP-only application, but it can also make use of telephony
cards (hence ss7 et al.). It seems it can also understand some GSM
dialect, too. But all that is optional and depends on what the user
needs; so some users may enable some of those options, while other users
may enable some other options.

> I thought configure options should limit the package footprint as much
> as possible.

Well, you could put it that way. I prefer to say:
    We have options so only what is strictly needed is present.

Which incidentally reduces the footprint! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
