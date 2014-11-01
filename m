From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 20:13:04 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
In-Reply-To: <1414799165.15213.1.camel@posteo.de>
References: <20141031115353.56D52B23C4@busybox.osuosl.org>
 <1414799165.15213.1.camel@posteo.de>
Message-ID: <20141101191304.GG10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-11-01 00:46 +0100, J?rg Krause spake thusly:
> On Fr, 2014-10-31 at 12:50 +0100, Peter Korsgaard wrote:
> > commit: http://git.buildroot.net/buildroot/commit/?id=e6c04e6daae674f8983ec2fb106fb897c6803c32
> > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/daa/daad247db16818f25ab33402e26e27257defbe13/
> > http://autobuild.buildroot.net/results/720/720e2c8a5eab8b47d2510fe03b4a90ec8beafc17/
> > http://autobuild.buildroot.net/results/02b/02b4ab9ee07707ee4a4d4ea2b9c67bee91b1392d/
> > http://autobuild.buildroot.net/results/819/81914317ce82dc1321484d8c2b65647f92aa6929/
> > 
> > And many others.
[--SNIP--]
> This patch breaks building avahi for me. Is autoreconf really intended?
> Removing it fixed my build.
> 
>         >>> avahi 0.6.31 Autoreconfiguring
[--SNIP--]
>         configure.ac:419: error: possibly undefined macro:
>         AM_GLIB_GNU_GETTEXT
>               If this token and others are legitimate, please use
>         m4_pattern_allow.

It seems it requires gettext.

J?rg, care to test adding this to avahi.mk (just below AUTORECONF):

    AVAHI_GETTEXTIZE = YES

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
