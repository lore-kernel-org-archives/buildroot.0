From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2018 21:54:37 +0200
Subject: [Buildroot] [PATCH] Fix issue with printvars executing giant
 shell command
In-Reply-To: <1537207369.7736.6.camel@impinj.com>
References: <20180817231548.29867-1-tpiepho@impinj.com>
 <20180829204929.GA2617@scaer>
 <1536601546.22056.12.camel@impinj.com>
 <20180910181837.GG2674@scaer> <1537207369.7736.6.camel@impinj.com>
Message-ID: <20180917195437.GB21035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-09-17 18:02 +0000, Trent Piepho spake thusly:
> On Mon, 2018-09-10 at 20:18 +0200, Yann E. MORIN wrote:
> > In a recipe, a command line that contains only spaces will not be executed
> > by make.
[--SNIP--]
> Ok, if you like that better.  My thought was "strip eats whitespace" is
> simple, but "a recipe line starting with a tab and containing only
> whitespace is skipped" is more obscure.  In fact, while it does appear
> to be true, I haven't found anything in the make docs clearly stating
> this.

From the make manual, chapter 5.1, "Recipe Syntax" [0], states:

    * A blank line that begins with a tab is not blank: it?s an empty
      recipe (see Empty Recipes).

... where "Empty Recipes" is a link to chapter 5.9, titled "Using
Empty Recipes" [1], which starts with:

    It is sometimes useful to define recipes which do nothing. This
    is done simply by giving a recipe that consists of nothing but
    whitespace.

[0] https://www.gnu.org/software/make/manual/make.html#Recipe-Syntax
[1] https://www.gnu.org/software/make/manual/make.html#Empty-Recipes

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
