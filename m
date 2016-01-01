From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2016 18:19:58 +0100
Subject: [Buildroot] [PATCH 1/1] openipmi: add OPENIPMI_VERSION_MAJOR
 variable
In-Reply-To: <5684FFAE.50701@mind.be>
References: <1451548770-2968-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20151231103141.580e0bfc@free-electrons.com>
 <5684FFAE.50701@mind.be>
Message-ID: <20160101171958.GE3710@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, Jerzy, All,

On 2015-12-31 11:13 +0100, Arnout Vandecappelle spake thusly:
> On 31-12-15 10:31, Thomas Petazzoni wrote:
> > On Thu, 31 Dec 2015 08:59:30 +0100, Jerzy Grzegorek wrote:
> >> -OPENIPMI_VERSION = 2.0.21
> >> -OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
> >> -OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
> >> +OPENIPMI_VERSION_MAJOR = 2.0
> >> +OPENIPMI_VERSION = $(OPENIPMI_VERSION_MAJOR).21
> >> +OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
> >> +OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%20$(OPENIPMI_VERSION_MAJOR)%20Library
> > 
> > I believe this is going a bit too far because what's encoded in the URL
> > here is not really the "major version", but the name of the project,
> > which is "OpenIPMI 2.0 Library".
> > 
> > So in this case, I don't think using the _VERSION_MAJOR thing is really
> > appropriate.
> > 
> > Let's see what others think about it.
> 
>  I don't care much either way. In general, I'm not too impressed with the
> introduction of _VERSION_MAJOR variables, because IMHO it doesn't simplify
> things at all. The idea is that it would be easier to bump the version, but in
> all likelihood, when the major version changes, you have bigger problems to deal
> with than just having to change things in two places.

I'm usually not against using _VERSION_MAJOR.

What however I find disturbing and to be unnecessary churn, is this
systematic change to using it.

I would prefer that we only switch to using _VERSION_MAJOR when there is
a reason to do so (e.g. shared amongst many variables, like version, URL,
path URLs, etc...) while bumping a package or fixing it somehow, and
that we do not do that change on its own.

However, the name of the project is not OpenIPMI 2.0 Library. It's just
OpenIPMI. Upstream also has "OpenIPMI 1.3 Library" and "OpenIPMI 1.4
Library" download locations, each corresponding to the 'major version'
of the library.

Still, I agree with Arnout, and I don't think we should do those changes
just for the sake of adding _VERSION_MAJOR. It should provide an actual
improvement (but I can see that URL encoding above is a bit confusing to
read without the variable).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
