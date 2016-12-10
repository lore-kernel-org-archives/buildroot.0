From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 10 Dec 2016 21:41:12 +0100
Subject: [Buildroot] [Patch v2 6/9] s6-rc: new package
In-Reply-To: <20161210195144.bdoczlscimsl5ocz@tarshish>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-7-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210195144.bdoczlscimsl5ocz@tarshish>
Message-ID: <20161210204112.GA15803@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 16-12-10 21:51:44, Baruch Siach wrote:
> Hi Eric,
>
> On Sat, Dec 10, 2016 at 08:20:47PM +0100, Eric Le Bihan wrote:
> > This new package provides s6-rc, a service manager for s6-based systems,
> > i.e. a suite of programs that can start and stop services, both
> > long-running daemons and one-time initialization scripts, in the proper
> > order according to a dependency tree.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> [...]
>
> > +$(eval $(generic-package))
> > +$(eval $(host-generic-package))
>
> What do you need the host build for? As far as I can see, no package in this
> series uses it.

Yes, no package in the series uses the host variant, but it is provided
as it allows the user to build the service database offline and include
it into the root file system (e.g. in a post-build script).

See [1] and [2] for more examples.

[1] https://github.com/elebihan/br2-ext-skarnet/blob/master/package/s6-br2-init-skeleton/s6-br2-init-skeleton.mk
[2] https://github.com/elebihan/br2-ext-skarnet/blob/master/board/common/post-build.sh

--
ELB
