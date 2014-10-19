From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 11:11:54 +0200
Subject: [Buildroot] [PATCH v2] modplugtools: Added package
In-Reply-To: <108749465.hOBsSJgTxk@hyperion>
References: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
 <1413662640-16030-1-git-send-email-maarten@treewalker.org>
 <20141018215748.GF31723@free.fr> <108749465.hOBsSJgTxk@hyperion>
Message-ID: <20141019091154.GI4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten, All,

On 2014-10-19 01:28 +0200, Maarten ter Huurne spake thusly:
> On Saturday 18 October 2014 23:57:48 Yann E. MORIN wrote:
> > On 2014-10-18 22:04 +0200, Maarten ter Huurne spake thusly:
> > > diff --git a/package/modplugtools/Config.in
> > > b/package/modplugtools/Config.in new file mode 100644
> > > index 0000000..20009b6
> > > --- /dev/null
> > > +++ b/package/modplugtools/Config.in
> > > @@ -0,0 +1,9 @@
> > > +config BR2_PACKAGE_MODPLUGTOOLS
> > > +	bool "modplugtools"
> > > +	select BR2_PACKAGE_LIBAO
> > > +	select BR2_PACKAGE_LIBMODPLUG
> > 
> > modplugtools should inherit the dependencies from libmodplug, namely
> > C++:
> > 
> >     config BR2_PACKAGE_MODPLUGTOOLS
> >         bool "modplugtools"
> >         depends on BR2_INSTALL_LIBSTDCPP # libmodplug
> >         select BR2_PACKAGE_LIBMODPLUG
> >         select BR2_PACKAGE_LIBAO
> 
> Hmm, I didn't expect to have to propagate dependencies manually.

Yes, see chapter 16.2.1, 'Choosing depends on or select' in the manual:
    http://buildroot.net/downloads/manual/manual.html#_literal_config_in_literal_file

Quoting:
    Note. The current problem with the kconfig language is that these
    two dependency semantics are not internally linked. Therefore, it may be
    possible to select a package, whom one of its dependencies/requirement
    is not met.

> On the 
> other hand, if Kconfig tried to do this automatically, including supporting 
> conditional dependencies, it might end up as a full Prolog interpreter. ;)

He! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
