From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 6 Dec 2015 20:55:25 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <87610bs0dv.fsf@dell.be.48ers.dk>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
Message-ID: <20151207015525.GH23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06 Dec 2015 23:00, Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Hello Mike,
>  > On 2015-12-02 02:35 -0500, Mike Frysinger spake thusly:
>  >> the busybox.net software has been languishing for quite a long time,
>  >> so i gave it a strong kick today.  just about every piece of software
>  >> has been upgraded on the box including bugzilla.  my various testing
>  >> looks like it still works, but if you guys notice anything weird, feel
>  >> free to let me know.
> 
>  > Yes, I've noticed that buildroot.org has switched to https with:
>  >     Strict-Transport-Security: max-age=63072000; includeSubDomains
> 
>  > Unfortunately, we do have subdomains that are not https-enabled, and are
>  > on another machine:
>  >     http://autobuild.buildroot.org/
> 
> sources.buildroot.{org,net} is another example (even though that it
> normally only accessed from wget, so less critical).

there's really no reason you can't generate a cert for those domains using
let's encrypt.  let's encrypt doesn't require you to own the root domain,
just be in control of the web server the domain resolves to.

> We have the same problem for lists.{buildroot,busybox,uclibc}.*, as that
> ends up serving an osuosl certificate.

those aren't a new issue ... they've always used osuosl certs.  those are
out of my control.

> We also have nightly.buildroot.{org,net} for the nightly generated
> manual.

you should also gen certs for those

> And finally we have patchwork.buildroot.{org,net} which redirects to the
> ozlabs patchwork.

gen certs for them.  if you can't, assign the IP to the main buildroot.org
box and i can take care of it.

>  > Which means anyone that has visited buildroot.org will be blocked from
>  > the sub-domains for the next two years (unles sthey switch to https
>  > too).
> 
> :/
> 
>  > What can we do about this?
> 
> Step 1 should imho be to disable HTST as soon as possible.

i've turned of HTST for subdomains for buildroot.org/buildroot.net.  i'm
leaving it on for the domains served directly off the box, and for all
uclibc.org and busybox.net domains.

> Then we might
> consider if we could HTTPS enable some of these subdomains, but they are
> on different hosts, which complicates stuff (E.G. we presumably need to
> distribute the buildroot.org private keys and update everywhere every 90
> days).

there is no need to distribute the same keys here.  just generate ones
for the domains in question using let's encrypt.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151206/7cc00c66/attachment.asc>
