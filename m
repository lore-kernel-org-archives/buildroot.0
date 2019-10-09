From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 9 Oct 2019 15:14:15 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <20191009141235.016e4b23@windsurf>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
 <20191009141235.016e4b23@windsurf>
Message-ID: <CAEyMn7a2w8vXSqHHmHtKmkn8okGVdOq=XSsbRaYtG_bOJ6T0hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +################################################################################
> > +#
> > +# netopeer2-keystored
> > +#
> > +################################################################################
> > +
> > +NETOPEER2_KEYSTORED_VERSION = v0.7-r2
> > +NETOPEER2_KEYSTORED_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_KEYSTORED_VERSION))
>
> This is the exact same source code you are fetching in
> netopeer2-keystored, netopeer2-server and netopeer2-cli. We do not want
> 3 separate Buildroot packages, but only one. Of course, it can have
> sub-options in the Config.in file so that the user can selectively
> enable keystored, cli and/or server.
>
> But generally speaking in Buildroot, the rule is one upstream project
> == one package. We do have a few exceptions to this rule for various
> reasons, but unless there's a good and strong justification, we like to
> keep this one upstream project == one package rule in place.
>
> > +NETOPEER2_KEYSTORED_LICENSE = BSD-3-Clause
> > +NETOPEER2_KEYSTORED_LICENSE_FILES = LICENSE
> > +NETOPEER2_KEYSTORED_SUBDIR = keystored
> > +NETOPEER2_KEYSTORED_DEPENDENCIES += host-sysrepo sysrepo

So I have to move all the stuff from the 3 packages (netopeer2-server,
netopeer2-cli, netopeer2-keystored) into one package e.g. netopeer2.
Is it possible to have there 3 different build targets depending on
the configuration?
