From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2013 23:32:08 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <CAHXCMMKP7WNGQV5xvmjf9gB_FOtxmvDZhYAMTSun2w=_ZOn9vA@mail.gmail.com>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
 <CAHXCMMKP7WNGQV5xvmjf9gB_FOtxmvDZhYAMTSun2w=_ZOn9vA@mail.gmail.com>
Message-ID: <201301012332.08643.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Smartin, All,

On Tuesday 01 January 2013 Samuel Martin wrote:
> 2013/1/1 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Packages that install daemons may need those daemons to run as a non-root,
> > or an otherwise non-system (eg. 'daemon'), user.
> >
> > Add infrastructure for packages to create users, by declaring the
> > FOO_USERS variable that conatin a makedev-syntax-like description
> > of the user(s) to add.
[--SNIP--]
> > diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
> > index 27517b3..fffdac9 100644
> > --- a/docs/manual/makedev-syntax.txt
> > +++ b/docs/manual/makedev-syntax.txt
> You could add this in a new file...
> Why should makedev-syntax.txt contain syntax details for makedev and mkusers?

Right, I'll do.

> > +- +password+ is the crypt(3)-encrypted password. If prefixed with +=+,
> > +  then it is interpreted as clear-text, and will be cypt-encoded. If
> > +  prefixed with +!+, then login is disabled. If set to +*+, then login
> > +  is not allowed.
> Multiple prefix is allowed/supported; it could be explicitly mentioned.
> Is the prefix order important?
> 
> So, the clear-text password itself should not starts with any prefix character?

Oh! You raise a valid point here. In fact, I coded '=!' as being the same
as '!=' , which it clearly is not.

So, valid combinations are:
    *           no password, login not allowed
    XXXX        crypt-encoded password
    !XXXX       crypt-encoded password, login disabled
    =1234       clear-text password
    !=1234      clear-text password, login disabled

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
