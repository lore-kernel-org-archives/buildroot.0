From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Mar 2014 23:45:01 +0100
Subject: [Buildroot] [PATCH] support: do not depend on bash
In-Reply-To: <87siqfw32l.fsf@dell.be.48ers.dk>
References: <1395173848-15759-1-git-send-email-yann.morin.1998@free.fr>
 <87siqfw32l.fsf@dell.be.48ers.dk>
Message-ID: <20140318224501.GC26810@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-03-18 23:32 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > We do want to work properly whatever the system shell or the
>  > user's login shell are.
> 
>  > The current check is anyway broken, as it only checks if the
>  > user's login shell is bash, not what the system shell is.
> 
>  > Remove the check altogether, since it is unneeded, and broken.
> 
> But we (currently atleast) do want bash for our own Makefiles (see
> toplevel Makefile). I'm not sure we're completely bashism-free (or if it
> is worth the trouble to be so).

OK, but then the check is jsut borked, since it does not check that basj
is isntalled on the system.

Notes:
  - SHELL is set in the environment by the login shell;
  - if one has bash as login shell, but sub-sequently runs dash, dahs
    does not reset SHELL and does not set it; instead, it uses the value
    that was pre-exisiting in the environment when it was launched.

So, all the current shell tests is whether the user's login shell is bash.

If instead we want to check that we do have bash installed on the
system, we need to fix the test.

As it is now, it is only confusing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
