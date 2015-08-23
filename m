From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2015 17:37:37 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <20150823163653.3989f210@free-electrons.com>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
Message-ID: <20150823153737.GD3729@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-23 16:36 +0200, Thomas Petazzoni spake thusly:
> On Sat, 22 Aug 2015 02:13:07 +0200, Yann E. MORIN wrote:
> > This package requires registration before it can be downloaded, which
> > means downloads can not be automated. As far as I could see, that's the
> > only package we have in that case.
> > 
> > It installs a kernel module, but it is not possible to check whether it
> > also builds it or just installs a blob. It seems however that there are
> > source files in that module:
> >     http://lists.busybox.net/pipermail/buildroot/2015-February/119752.html
> > 
> > But since we can't download without registration, it's impossible to
> > check if using the kernel-module infra would work.
> > 
> > We also have no license for it.
> > 
> > This package does not belong to Buildroot. Remove it.
> 
> I completely disagree with this.

Unsurprising. I knew you would. ;-)

> We are using this package for a real project,

Irrelevant.

Some users of Buildroot want binary packages so they can use ipkg, opkg
or rpm to install/remove/update packages on the target. We're however
saying that's not something that Buildroot should provide.

Some users want a compiler on the target. Yet, we're still arguing that
is not a goal Buildroot should pursue.

I do not think a corporate will should be the *sole* reason we have
something in Buildroot.

> We did contact Bluegiga (the upstream for this package) about the
> annoyance caused by the registration process needed to download the
> tarball. However, for licensing/legal reasons, they apparently have no
> other choice, and they are well aware of the annoyance caused by this
> process.

OK, I would have bet you had contacted them. Sad they did not change
their mind. :-(

> The wf111 package bundles a kernel module (built from source) and some
> binary only user-space tools. For the embedded Linux systems that use
> the Bluegiga WF111 chip, it makes things a lot easier to have the wf111
> integrated in Buildroot, rather than having to build it separately.

Well, that's not an excuse.

> In addition, the registration process is free and can be done by anyone
> interested by the package.

From what I understood from their registration form (which I did not
fill), is that this is a manual process on their side, and that
non-coporate users will simply be treated as second-zone:

    Please use your business e-mail address in the form. Use of non
    business e-mail domains may delay account creation.

> It is indeed annoying, but not that worst
> that any of the proprietary licensed package that we have, which all
> very often have weird and complicated build systems that require lots
> of tricks.

License for those packages not the problem. They are directly
downloadable. There is no artificial technical barrier to getting their
archives (tar/zip/git/...)

That package is the *only* one we have in BR (unless I missed any) for
which this is not the case.

> So, I completely disagree with this removal proposal, especially since
> there is absolutely no real problem caused by this package.

Oh, it does not. I was surprised to not see it in the autobuilders. But
that's simply because it depends on a kernel to be built, and we never
build a kernel.

The day we use a testing framework (like your nice pending proposal), we
will start to see failures because of that package. And blacklisting it
in the autobuilders' code would not be the right answer.

So, I completely disagree with these non-removal arguments you made.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
