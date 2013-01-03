From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 22:46:28 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <201301012332.08643.yann.morin.1998@free.fr>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <CAHXCMMKP7WNGQV5xvmjf9gB_FOtxmvDZhYAMTSun2w=_ZOn9vA@mail.gmail.com>
 <201301012332.08643.yann.morin.1998@free.fr>
Message-ID: <201301032246.28934.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On Tuesday 01 January 2013 Yann E. MORIN wrote:
> On Tuesday 01 January 2013 Samuel Martin wrote:
> > 2013/1/1 Yann E. MORIN <yann.morin.1998@free.fr>:
[--SNIP--]
> > > +- +password+ is the crypt(3)-encrypted password. If prefixed with +=+,
> > > +  then it is interpreted as clear-text, and will be cypt-encoded. If
> > > +  prefixed with +!+, then login is disabled. If set to +*+, then login
> > > +  is not allowed.
> > Multiple prefix is allowed/supported; it could be explicitly mentioned.
> > Is the prefix order important?
> > 
> > So, the clear-text password itself should not starts with any prefix character?
[--SNIP--]
> So, valid combinations are:
>     *           no password, login not allowed
>     XXXX        crypt-encoded password
>     !XXXX       crypt-encoded password, login disabled
>     =1234       clear-text password
>     !=1234      clear-text password, login disabled

And of course, '!' and '=' are not in the set of characters that crypt can
emit for an encoded password, so it is legit to write:
    =           empty password
    =!foo       clear-text password starts with a '!'
    ==bar       clear-text password starts with a '='
    !=          empty password                       , login is disabled
    !=!foo      clear-text password starts with a '!', login is disabled
    !==bar      clear-text password starts with a '=', login is disabled

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
