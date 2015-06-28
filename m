From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 28 Jun 2015 12:02:01 +0200
Subject: [Buildroot] [PATCH] uclibc: deprecate locale support
In-Reply-To: <20150628095049.GA3950@free.fr>
References: <20150628071417.GA13377@waldemar-brodkorb.de>
 <20150628095049.GA3950@free.fr>
Message-ID: <20150628100200.GN31780@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Yann E. MORIN wrote,

> Waldemar, All,
> 
> On 2015-06-28 09:14 +0200, Waldemar Brodkorb spake thusly:
> > The quality of the locale implementation in uClibc seems
> > to be bad. Recently a discussion on the uClibc mailinglist
> > showed that the uClibc maintainer has no time to fix
> > remaining issues in the locale implementation.
> > http://lists.uclibc.org/pipermail/uclibc/2015-June/049000.html
> > 
> > Because of the bad state of the code I would like to deprecate
> > it. I never used it myself and see no good reason why I would
> > need it for an embedded system.
> > 
> > I believe not many people are using it. For good working
> > locale support there is still GNU libc and musl.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> While on principle I'm not opposed to deprecating locale support in
> uClibc altogether.
> 
> However, we've had locales working in uClinc so far, it's only with
> uClibc-ng that we started to have build failures (AFAICS).

I am really sure this also happens with uClibc git master.
It worked for 0.9.33.2 in some way, but it is broken in latest code.
So uclibc-ng inherited that.
 
> So, I find it a bit cavalier that we remove support for locales when
> uClibc-ng / uClibc is used, like we'd hide the dirt under the rug.

I planned to remove/deprecate support for locales before the
autobuilders started to show the bad situation. Just didn't had the
time to prepare a patch.
 
May be it is just time to get rid of this unmaintained
functionality.

If someone have a usecase for locales and prepares a patch, I will
not reject it.

best regards
 Waldemar
