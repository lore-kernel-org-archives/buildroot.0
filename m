From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 1 Sep 2019 09:46:26 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-stats: query release-monitoring.org
 with upstream name
In-Reply-To: <20190828144352.239a231d@windsurf.home>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
 <20190828144352.239a231d@windsurf.home>
Message-ID: <CAB0FRsuSyCzRrxJWBq-ZsHMvpa0f-K9TrG-2Anu1_roCXMKHqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 28 ao?t 2019 ? 14:44, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> +Victor Huesca in Cc.
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
> Thanks for implementing this. It matches what we discussed. The only
> possible issue that I can see is if a package defines FOO_DISTNAME for
> some internal reason, but is not a perl-package. Then we will pick up
> whatever DISTNAME contains.
>
> Perhaps we should standardize on FOO_NAME_UPSTREAM for all package
> infrastructures including perl-package, and make it a "reserved"
> variable name, so that it is forbidden to use it for anything else ?
>
>
Sounds great.
If we have our own FOO_NAME_UPSTREAM, that avoids to register "mapping" on
release-monitoring.org for any package.

When this addition will be validated, I'll cook one patch which updates
(s/DISTNAME/UPSTREAM_NAME/) the 110 Perl/CPAN packages and a V2 of this
patch.

Fran?ois

Thomas
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190901/73976526/attachment.html>
