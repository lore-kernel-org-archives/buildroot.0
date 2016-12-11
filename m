From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Dec 2016 19:38:26 +0100
Subject: [Buildroot] [Patch v2 3/9] s6: new package
In-Reply-To: <20161210215222.6989afd3@free-electrons.com>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210215222.6989afd3@free-electrons.com>
Message-ID: <20161211183826.GC23661@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 16-12-10 21:52:22, Thomas Petazzoni wrote:

[...]

> > +define S6_INSTALL_STAGING_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> > +endef
>
> You're doing a plain "make install" here.
>
> > +define HOST_S6_INSTALL_CMDS
> > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
> > +		install-dynlib \
> > +		install-include
> > +endef
>
> but not here. Why?

The host variant of s6 builds some process supervision programs that I
deemed unuseful for the user, and only the libraries and headers are
needed to build the host variants of execline and s6-rc. But it is true
that this also applies to the staging directory. So, I'll use
"install-dynlib install-include" in this case too.

Thanks for the review.

--
ELB
