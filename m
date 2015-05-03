From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2015 16:52:39 +0200
Subject: [Buildroot] [PATCH] autotools-package: also handle
 pre-installed external toolchain in .la fixup
In-Reply-To: <5545EDB2.3090500@mind.be>
References: <1430603450-17855-1-git-send-email-arnout@mind.be>
 <20150502223434.GK13701@free.fr> <5545EDB2.3090500@mind.be>
Message-ID: <20150503145239.GA4154@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-03 11:43 +0200, Arnout Vandecappelle spake thusly:
> On 03/05/15 00:34, Yann E. MORIN wrote:
> > On 2015-05-02 23:50 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> >> The .la fixup handling looks for paths starting with /usr and assumes
> >> that they are missing the installation prefix (i.e. $(STAGING_DIR)). It
> >> already handles the cases that $(STAGING_DIR) itself and $(BASE_DIR)
> >> are under /usr, but it does not yet handle the case that a
> >> pre-installed external toolchain is under /usr (and tracks that fact
> >> in some .la file). For instance, if you use buildroot to generate a
> >> toolchain with HOST_DIR=/usr/local/some_path, this problem will occur.
> >>
> >> Fix this in the same way as $(STAGING_DIR) and $(BASE_DIR), but in
> >> addition check that TOOLCHAIN_EXTERNAL_INSTALL_DIR is non-empty. For
> >> internal toolchains, it is empty and the sed expression would fail.
> >>
> >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >> Reported-by: Carlos Soto <csotoalonso@gmail.com>
> >> Cc: Carlos Soto <csotoalonso@gmail.com>
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > I however wonder: shouldn't we do that .la munging in a hook that we
> > forcibly add to the list of post-staging-install hooks, so that it is
> > run even for those packages that redefine their _INSTALL_STAGING_CMDS ?
> 
>  I had the same thought... Even more: it is not really tied to autotools-package
> because generic packages may also use libtool, so it could go directly into the
> .stamp_staging_installed code.

Agreed. Shall I do it, or do you already have something on your side?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
