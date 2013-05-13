From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 17:46:08 +0200
Subject: [Buildroot] [PATCH 1/1] cppcms: new package
In-Reply-To: <CAHXCMMKk_9+Dkf5N1-6vESLEb1K6dT+UOc1qD_jkh5CKn-K9Kw@mail.gmail.com>
References: <1366817732-27616-1-git-send-email-nicolas.menegale@openwide.fr>
 <CAHXCMMKk_9+Dkf5N1-6vESLEb1K6dT+UOc1qD_jkh5CKn-K9Kw@mail.gmail.com>
Message-ID: <20130513174608.4af180cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 13 May 2013 17:21:28 +0200, Samuel Martin wrote:

> 2013/4/24 nmenegale <nicolas.menegale@openwide.fr>:
> > Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
> > ---
> > v0: initial commit
> > CppCMS is a C++ web framework. The cppcms.mk also copy into the host after staging install two
> > scripts needed when you compile an application using the web framework (cppcms_tmpl_cc and cppcms_run)
> > As discussed on IRC it's not worth creating an host-cppcms package for two script.

[...]

> > +define CPPCMS_INSTALL_HOST_TOOLS
> > +       cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/usr/bin/cppcms_tmpl_cc
> > +       cp $(STAGING_DIR)/usr/bin/cppcms_run $(HOST_DIR)/usr/bin/cppcms_run
> Dubious...
> This means the host-cppcms package should depend on the cppcms one;
> usually that's the other way!
> 
> Also, if cppcms_{run,tmpl_cc} are binaries, this may only be valid if
> the target system is compatible
> with the host one... which is usually not the case.
> However, if they're just bash or python scripts, it's ok; though I'd
> prefer you copy them from the package
> build directory rather than from the staging tree.

Did you read the commit log?

Nicolas:

 *) Your commit log lines are too long. Please wrap at ~80 columns.

 *) Your should add a comment in the .mk file to explain what you're
    doing with those cppcms_tmpl_cc and cppcms_run scripts, so that we
    remember why the funky thing you're doing works. You can just
    copy/paste parts of your commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
