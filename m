From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Jul 2013 18:14:54 +0200
Subject: [Buildroot] [RFC] libedit: start using autotools-based libedit?
In-Reply-To: <CAAXf6LWhF4jktm-zzHiE6Cfj6QdNNLJ7xpBQ+zvfGQB9CgBeqg@mail.gmail.com>
References: <CAAXf6LWhF4jktm-zzHiE6Cfj6QdNNLJ7xpBQ+zvfGQB9CgBeqg@mail.gmail.com>
Message-ID: <20130719161454.GB3751@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-19 16:22 +0200, Thomas De Schampheleire spake thusly:
> The current libedit library in buildroot is downloaded from debian (no
> regular homepage) and is a generic package. However, there also exists
> another libedit package, that is autotools-based, based on NetBSD
> libedit, and still active (latest release of 2013-07-12)
> 
> See http://www.thrysoee.dk/editline/
> 
> My question is: what do you think about starting to use that version?
> 
> I don't have code currently using libedit, so I can't assess whether
> both are compatible or not.
> 
> The .mk file would become much simpler:
> LIBEDIT_VERSION = 20130712-3.1
> LIBEDIT_SITE    = http://www.thrysoee.dk/editline
> LIBEDIT_INSTALL_STAGING = YES
  $(eval $(autotools-package))

;-)

> so there's definitely some advantage to it.
> 
> Any users of libedit care to try?

OK, I'm queuing this for testing. Thanks for pointing this out. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
