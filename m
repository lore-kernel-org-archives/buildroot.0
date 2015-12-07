From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Dec 2015 07:34:54 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207015525.GH23754@vapier.lan> (Mike Frysinger's message of
 "Sun, 6 Dec 2015 20:55:25 -0500")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
Message-ID: <87bna2rckx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 >> > Unfortunately, we do have subdomains that are not https-enabled, and are
 >> > on another machine:
 >> >     http://autobuild.buildroot.org/
 >> 
 >> sources.buildroot.{org,net} is another example (even though that it
 >> normally only accessed from wget, so less critical).

 > there's really no reason you can't generate a cert for those domains using
 > let's encrypt.  let's encrypt doesn't require you to own the root domain,
 > just be in control of the web server the domain resolves to.

Ok, but for sources.buildroot.net I wouldn't want to enforce TLS as
E.G. wget on ancient enterprice dists wont recognize the CA and fail.


 >> We have the same problem for lists.{buildroot,busybox,uclibc}.*, as that
 >> ends up serving an osuosl certificate.

 > those aren't a new issue ... they've always used osuosl certs.  those are
 > out of my control.

Yes, but with the HSTS headers we now force people to access it through
https, and atleast my browser won't allow it because the certificate
doesn't match.


 >> > What can we do about this?
 >> 
 >> Step 1 should imho be to disable HTST as soon as possible.

 > i've turned of HTST for subdomains for buildroot.org/buildroot.net.  i'm
 > leaving it on for the domains served directly off the box, and for all
 > uclibc.org and busybox.net domains.

Ok, great - Thanks. The fact that you still have it enabled on busybox
means that lists.busybox.net (which is referred in the list- headers)
won't work, so it would be good if you could also disable
includeSubDomains there.


 >> Then we might
 >> consider if we could HTTPS enable some of these subdomains, but they are
 >> on different hosts, which complicates stuff (E.G. we presumably need to
 >> distribute the buildroot.org private keys and update everywhere every 90
 >> days).

 > there is no need to distribute the same keys here.  just generate ones
 > for the domains in question using let's encrypt.

I'll have a look at generating letsencrypt keys for nightly.* and
patchwork.*.

Any specific hints about it?

-- 
Venlig hilsen,
Peter Korsgaard 
