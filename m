From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 18:49:18 +0100
Subject: [Buildroot] [PATCH] pakage/erlang: fix host build without
 termcap (curses) library
In-Reply-To: <20141118093152.70fa0bd7@free-electrons.com>
References: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
 <20141118093152.70fa0bd7@free-electrons.com>
Message-ID: <20141118174918.GB4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-18 09:31 +0100, Thomas Petazzoni spake thusly:
> On Mon, 17 Nov 2014 23:33:16 +0100, Yann E. MORIN wrote:
> > Cc-ing Nathaniel, as all failures happen on his build server. Thomas and
> > Nathaniel, could you please review the setting of that autobuild server?
> > And the others as well?
> 
> We already discussed this on the mailing list some time ago.
> Nathaniel's build server is the only one where libncurses-dev is not
> installed in the system. And since libncurses-dev is not part of our
> mandatory dependencies (someone could very well use gconfig or xconfig
> only, for example), we thought that keeping Nathaniel's configuration
> as is was a good way of catching the cases where we have a missing
> dependency on host-ncurses.
> 
> I remember we even had a discussion to decide whether we should build
> host-ncurses in such cases, or whether we should make libncurses-dev a
> hard dependency of Buildroot, and Peter decided that building
> host-ncurses was the right solution.

I fully back this resolution. It is very often that a build server
(whether it is for us to do autobuilds, or a production build server)
lacks such libraries.

So, we have to fix such build failures by either:
  - adding a dependency on host-ncurses, or
  - disabling ncurses/termcap support for the host tools if it makes
    sense and it is possible, otherwise revert to depending on
    host-ncurses.

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
