From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Dec 2015 23:00:44 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151206214229.GE4023@free.fr> (Yann E. MORIN's message of "Sun, 
 6 Dec 2015 22:42:29 +0100")
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
Message-ID: <87610bs0dv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello Mike,
 > On 2015-12-02 02:35 -0500, Mike Frysinger spake thusly:
 >> the busybox.net software has been languishing for quite a long time,
 >> so i gave it a strong kick today.  just about every piece of software
 >> has been upgraded on the box including bugzilla.  my various testing
 >> looks like it still works, but if you guys notice anything weird, feel
 >> free to let me know.

 > Yes, I've noticed that buildroot.org has switched to https with:
 >     Strict-Transport-Security: max-age=63072000; includeSubDomains

 > Unfortunately, we do have subdomains that are not https-enabled, and are
 > on another machine:
 >     http://autobuild.buildroot.org/

sources.buildroot.{org,net} is another example (even though that it
normally only accessed from wget, so less critical).

We have the same problem for lists.{buildroot,busybox,uclibc}.*, as that
ends up serving an osuosl certificate.

We also have nightly.buildroot.{org,net} for the nightly generated
manual.

And finally we have patchwork.buildroot.{org,net} which redirects to the
ozlabs patchwork.

 > Which means anyone that has visited buildroot.org will be blocked from
 > the sub-domains for the next two years (unles sthey switch to https
 > too).

:/

 > What can we do about this?

Step 1 should imho be to disable HTST as soon as possible. Then we might
consider if we could HTTPS enable some of these subdomains, but they are
on different hosts, which complicates stuff (E.G. we presumably need to
distribute the buildroot.org private keys and update everywhere every 90
days).

-- 
Bye, Peter Korsgaard
