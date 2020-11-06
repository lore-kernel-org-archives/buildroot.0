From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Nov 2020 00:23:49 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: exclude DL_DIR from
 savedefconfig
In-Reply-To: <20201021200130.GL3466@scaer>
References: <alpine.DEB.2.20.2010211133360.29285@defender.svolli.xa>
 <20201021200130.GL3466@scaer>
Message-ID: <20201106232349.GA3971474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven, All,

On 2020-10-21 22:01 +0200, Yann E. MORIN spake thusly:
> On 2020-10-21 12:34 +0200, Sven Oliver Moll spake thusly:
> > Running "make savedefconfig" with DL_DIR set also saves that variable,
> > which is only useful in local context.
> > Signed-off-by: Sven Oliver Moll <buildroot@svol.li>
> Applied to master, thanks.

Unfortunately, I had to revert it. Some people were quick to complain on
IRC the very moment I applied it, and we also recently got a bug report
about it, see https://bugs.busybox.net/show_bug.cgi?id=13291

After discussing the subject between the maintainers, we've come to the
conclusion that indeed, such site-local settings should not end up in
the saved defconfig files.

However, the discussion also highlighted that there were quite a few
other such configuration options that really are site-local settings:
BR2_CCACHE_DIR, BR2_PACKAGE_OVERRIDE_FILE (which defaults to, guess
what: 'local.mk'!), but also some less obvious ones, like BR2_WGET,
BR2_SVN, BR2_GIT et al.

Getting rid of those as configuration options, and converting them to
site-local settings will require that we first get a means for easily
handling such site-local settings.

In the meantime, we've concluded that reverting was the best course of
actions.

Sorry that we had to revert your change.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
