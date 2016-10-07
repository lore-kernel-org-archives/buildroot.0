From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:26:19 +0200
Subject: [Buildroot] [git commit] package/python-rtslib-fb: bump version
 to 2.1.58
In-Reply-To: <20161007181627.7ff94cb3@trantor>
References: <20161007131551.D7C9680089@busybox.osuosl.org>
 <20161007181627.7ff94cb3@trantor>
Message-ID: <20161007222619.1a5f7701@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 18:16:27 +0200, Christophe Vu-Brugier wrote:

> Sorry for commenting a patch after it has been applied.

No problem, it's never too late to fix things up.

> > -PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
> > -PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
> > +PYTHON_RTSLIB_FB_VERSION = 2.1.58
> > +PYTHON_RTSLIB_FB_SOURCE = rtslib-fb-$(PYTHON_RTSLIB_FB_VERSION).tar.gz
> > +PYTHON_RTSLIB_FB_SITE = https://pypi.python.org/packages/c8/26/ae0ff9a721d046bef78c457d8fc19287f7dbe36f98f5e190b017f0d9e9b7  
> 
> The home of rtslib-fb is still on GitHub but its maintainer, Andy
> Grover, has moved the repository ownership to the open-iscsi
> organization [1].
> 
> So the homepage of rtslib-fb, configshell-fb and targetcli-fb is now :
> 
>   https://github.com/open-iscsi/{rtslib,configshell,targetcli}-fb
> 
> The old URL still works though.

OK. A patch updating the upstream URL in Config.in would be good.

> Moreover, version 2.1.58 is not the latest version since 2.1.60 was
> released a few days ago [2].

Right, but the latest version available from Pypi is 2.1.58, see
https://pypi.org/project/rtslib-fb/. If you don't want a Python package
to be changed to fetch from Pypi, I think a comment in the .mk file
should be added.

> Note that targetcli-fb, configshell-fb and rtslib-fb are released at
> the same time because they are closely related (targetcli-fb imports
> both rtslib-fb and configshell-fb).
> 
> So for Buildroot, it makes sense to upgrade rtslib-fb, configshell-fb
> and targetcli-fb at the same time but upgrading only one of them is a
> bit risky because you end up shipping versions of the packages that
> were not tested together by upstream developers.

OK. I think this should be mentioned in a comment above the _VERSION
field of those packages. This way, it is clearly visible when bumping
the version of those packags.

> IIRC, I tried to bump targetcli-fb and its dependencies locally several
> month ago but encountered problems since targetcli-fb now depends
> on DBUS. I was also reluctant to upgrade rtslib-fb because it now
> depends on pyudev and I usually run targetcli without systemd/udev in
> Buildroot.

Those problems are due to upstream decisions, and we should not stop
from upgrading because of such decisions. If you dislike those
decisions, the solution is not to stop upgrading. The solution is to
contact upstream and complain (possibly by submitting patches).

Buildroot's policy is to follow what upstream decides... even if you
don't like it :)

> I may resume work on upgrading targetcli-fb, configshell-fb
> and rtslib-fb though.

OK. However, it is not clear from your e-mail if you think Bernd's
patch should be reverted. Could you clarify this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
