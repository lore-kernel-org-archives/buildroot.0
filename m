From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Sep 2013 00:24:06 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130912201847.35df6dfd@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr> <20130912201847.35df6dfd@skate>
Message-ID: <20130912222406.GF3362@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-09-12 20:18 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 11 Sep 2013 19:27:09 +0200, Yann E. MORIN wrote:
> 
> > > That just becomes nasty and doesn't really easily allow for different 
> > > configurations where you don't always want all your propriety packages
> > > to build. Also it doesn't make your propriety packages visible within
> > > the buildroot menuconfig. The other nice feature is the is that company's
> > > configs are automatically pulled in a separate area.
> > 
> > The way *I* see this is that Buildroot is not the main /frontend/ of the
> > build system, but rather a backend. That's the way I use it: I have a
> > kind of /upper-layer/ build system that uses Buildroot as a kind of
> > /backend/.
> 
> I think that's one way of using it, but that's not necessarily the only
> way we should support.

Sorry, I never said so. I just said how *I* use it in my own use-case,
to illustrate yet another way to use Buildroot.

> In all the Buildroot based projects I've done,
> I've also tried to make Buildroot directly be the front-end, and
> include whatever build logic is needed within Buildroot.
> 
> I can only remember of one project in which I did not do that, and it
> was because the customer had already written his build logic using
> Buildroot as a back-end.

Yes, we should keep Buildroot a self-contained project. That it gets
also used as a kind of backend does not mean Buildrot *is* a backend.

> > Yes, as I said above, I would have expected companies (well, people at
> > companies) be stressed by projects deadlines, and that they would work
> > in BR2_EXTERNAL, and only try to upstream later, when it would be too
> > late (for them!) to have proper reviews, since they would be internally
> > committed to their changes in BR2_EXTERNAL, and we would not be able to
> > take their changes.
> > 
> > But if people use BR2_EXTERNAL as a fallback for anything that did not
> > make it upstream (by lack of time, or of interest), or for purely
> > internal stuff, then I don't see a reason for concern. All the better! :-)
> 
> If companies are in a hurry, they are not going to upstream anything
> anyway, so we're not loosing something. Today, without BR2_EXTERNAL,
> companies can already fork Buildroot, do a massive amount of changes
> directly within Buildroot, and not upstream anything at all. Therefore,
> adding BR2_EXTERNAL is not going to make things worse.
> 
> I believe it could potentially make things better. It might allow
> companies to separate what they consider "company-specific" in the
> BR2_EXTERNAL directory, while still making the Buildroot core changes,
> or open-source package additions in the main Buildroot tree, and submit
> those changes upstream. It allows them to keep cleanly separated the
> changes that will never be upstreamed because it doesn't make sense
> (specific board support, highly specific and proprietary packages) from
> the things that might be upstreamed if the submission effort is made.

I completely agree with you.

You showed me the Light, and I've seen the Light, now! :-)

Anyway, maybe we should make this clear in the manual what BR2_EXTERNAL
is really for non-FLOSS, proprietary packages, and that FLOSS packages
should be done in Buildroot, nit in BR2_EXTERNAL.

Alternatively, I can see BR2_EXTERNAL as a staging location where a
company may introduce new (FLOSS) packages, and move them to Buildroot
just prior to upstreaming. Enforcing Buildroot's layout in BR2_EXTERNAL
would surely help in this regard, I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
