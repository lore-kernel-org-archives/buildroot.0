From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 7 Feb 2020 17:58:57 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-stats: query release-monitoring.org
 with upstream name
In-Reply-To: <20200205181702.4abbbd83@windsurf>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
 <20200205181702.4abbbd83@windsurf>
Message-ID: <CAB0FRsvs4Rm-ZHvSsDgZHijSM1qL7ygsWAhaK=S_cDdWC+n80Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 5 f?vr. 2020 ? 18:17, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Wed, 28 Aug 2019 09:02:50 +0200
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > By default, this upstream name is our BR name.
> > But with perl-package infrastructure, the variables *_DISTNAME
> > give the CPAN name which is known by release-monitoring.org
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Since we have this information already in Buildroot, it makes sense to
> use it. However, the search on release-monitoring.org is done in two
> steps:
>
>  - Using the Buildroot distribution in release-monitoring and its
>    mapping concept. In this case, we really want to use the Buildroot
>    package name unchanged (which is not what your patch does)
>
>
It means that a part of Buildroot source (or configuration) is hosted on
release-monitoring.org instead of our own git repository.


>  - Then, if no result is found through the Buildroot distribution
>    above, we search in the entire namespace. Here, we should search
>    with _DISTNAME when available. We could also improve the logic to
>    strip python- and lua- in the front of packages, to help the guess
>    to work.
>
> Would you be willing to work on this ? It's not too far from the patch
> you have already implemented here.
>
>
Another point about release-monitoring.org,
how to exclude `dev` branches when the policy of the upstream project is to
name them with an odd minor number ?

Here, some false positives:
                          perl |  DISTRO  |
https://release-monitoring.org/project/13599 | 5.30.1       | 5.31.8
|
                     webkitgtk |  DISTRO  |
https://release-monitoring.org/project/05355 | 2.26.3       | 2.27.4
|
                     wpewebkit |  DISTRO  |
https://release-monitoring.org/project/17557 | 2.26.3       | 2.27.4
|

Fran?ois

Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200207/ad86134b/attachment.html>
