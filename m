From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Jun 2020 22:49:20 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: extend the list of
 unsafe paths
In-Reply-To: <20200622224022.4db35402@windsurf.home>
References: <20200621203158.14520-1-yann.morin.1998@free.fr>
 <20200622224022.4db35402@windsurf.home>
Message-ID: <20200622204920.GU2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-06-22 22:40 +0200, Thomas Petazzoni spake thusly:
> On Sun, 21 Jun 2020 22:31:58 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On some legacy systems, the X11 headers and libs are in /usr/X11R66/include
> > and /usr/X11R66/lib, and of course, some packages are trying to be smart
> > and use those paths (even when they do not exist).
> > 
> > Add those to the list of unsafe paths to check in the toolchain wrapper.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  toolchain/toolchain-wrapper.c | 2 ++
> >  1 file changed, 2 insertions(+)
> Applied to master, thanks. Do you remember why we don't simply
> blacklist /usr entirely ?

Becuase that would be too easy? ;-)

No, but same reason we are (trying  to be smart when fixing the .la
files, see 7701fc53d1 (infra: support buildroot being located in /usr).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
