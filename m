From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Oct 2017 20:05:02 +0200
Subject: [Buildroot] [PATCH v3 2/3] docs/manual: document meson-based
 packages
In-Reply-To: <20171008184855.GB17300@momiji>
References: <20170727095527.14324-1-joerg.krause@embedded.rocks>
 <20170727095527.14324-3-joerg.krause@embedded.rocks>
 <20171008100341.GB2803@scaer> <20171008144817.GB17840@itchy>
 <20171008184855.GB17300@momiji>
Message-ID: <20171008180502.GD2803@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2017-10-08 18:48 +0200, Adrian Perez de Castro spake thusly:
> On Sun, 8 Oct 2017 16:48:17 +0200, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> > On 17-10-08 12:03:41, Yann E. MORIN wrote:
> > > On 2017-07-27 11:55 +0200, J?rg Krause spake thusly:
> > > > From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[--SNIP--]
> > > > +20: define FOO_CONFIGURE_CMDS
> > > > +21: 	rm -rf $(@D)/build
> > > We don't usually remove stuff created in a previous run, unless it
> > > breaks the build.
> > OK.
> Though you may want/need to remove the build directory at least for the
> ?<pkg>-reconfigure? target because Meson will refuse to use an
> already-configured build directory:
[--SNIP--]

This is a good reason to forcibly remove it, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
