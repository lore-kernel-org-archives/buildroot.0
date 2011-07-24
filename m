From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 24 Jul 2011 22:12:55 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <87ipqrwig7.fsf@macbook.be.48ers.dk>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <CAAXf6LW+awPoagLehXSVccwgGO4qJf8goaVZEoNaKeD+Q2fi1w@mail.gmail.com>
 <87ipqrwig7.fsf@macbook.be.48ers.dk>
Message-ID: <201107242212.56088.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 24 July 2011 22:07:52 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>  >> It's furthermore not easy to handle a BR_CCACHE_DIR variable
>  >> containing shell variables (like $HOME) that should get expanded
>  >> before make handles it.
> 
>  Thomas> What exactly is the problem here? Other configuration options
>  Thomas> can use shell variables like $(USER) without problem. The only
>  Thomas> thing to keep in mind is to write these variables in make
>  Thomas> syntax with parentheses, rather than in shell syntax with
>  Thomas> either curly braces or nothing.
> 
> Indeed, that's the (potential) problem. People need to write the patch
> in make syntax rather than shell,

Well, parenthesis or braces, make does not mind:
  http://www.gnu.org/software/make/manual/make.html#Reference

Excerpt:
  To substitute a variable's value, write a dollar sign followed by the name
  of the variable in parentheses or braces: either ?$(foo)? or ?${foo}? is a
  valid reference to the variable foo.

Although parenthesis are being traditionally used in Makefile.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
