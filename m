From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 20:18:47 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130911172709.GB3410@free.fr>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
Message-ID: <20130912201847.35df6dfd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 11 Sep 2013 19:27:09 +0200, Yann E. MORIN wrote:

> > That just becomes nasty and doesn't really easily allow for different 
> > configurations where you don't always want all your propriety packages
> > to build. Also it doesn't make your propriety packages visible within
> > the buildroot menuconfig. The other nice feature is the is that company's
> > configs are automatically pulled in a separate area.
> 
> The way *I* see this is that Buildroot is not the main /frontend/ of the
> build system, but rather a backend. That's the way I use it: I have a
> kind of /upper-layer/ build system that uses Buildroot as a kind of
> /backend/.

I think that's one way of using it, but that's not necessarily the only
way we should support. In all the Buildroot based projects I've done,
I've also tried to make Buildroot directly be the front-end, and
include whatever build logic is needed within Buildroot.

I can only remember of one project in which I did not do that, and it
was because the customer had already written his build logic using
Buildroot as a back-end.

> Yes, as I said above, I would have expected companies (well, people at
> companies) be stressed by projects deadlines, and that they would work
> in BR2_EXTERNAL, and only try to upstream later, when it would be too
> late (for them!) to have proper reviews, since they would be internally
> committed to their changes in BR2_EXTERNAL, and we would not be able to
> take their changes.
> 
> But if people use BR2_EXTERNAL as a fallback for anything that did not
> make it upstream (by lack of time, or of interest), or for purely
> internal stuff, then I don't see a reason for concern. All the better! :-)

If companies are in a hurry, they are not going to upstream anything
anyway, so we're not loosing something. Today, without BR2_EXTERNAL,
companies can already fork Buildroot, do a massive amount of changes
directly within Buildroot, and not upstream anything at all. Therefore,
adding BR2_EXTERNAL is not going to make things worse.

I believe it could potentially make things better. It might allow
companies to separate what they consider "company-specific" in the
BR2_EXTERNAL directory, while still making the Buildroot core changes,
or open-source package additions in the main Buildroot tree, and submit
those changes upstream. It allows them to keep cleanly separated the
changes that will never be upstreamed because it doesn't make sense
(specific board support, highly specific and proprietary packages) from
the things that might be upstreamed if the submission effort is made.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
