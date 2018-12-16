From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 14:54:27 +0100
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
Message-ID: <20181216145427.0274aed5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Thu, 19 Apr 2018 10:14:40 +0300, Stefan Becker wrote:

> On Thu, Apr 19, 2018 at 1:27 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >  I'm still not convinced that this is such a great idea.
> >
> > 1. As explained in reply to your first iteration, there shouldn't be a need for
> > including Buildroot variables in a surrounding Makefile.  
> 
> There is nothing you can say that will change the fact that a
> monolithic meta build system is too slow for the CI of our own
> components. So let's just agree to disagree on this point.

I'm jumping back to this very old thread. Could you explain (perhaps
re-explain) what you're trying to do ?

If you need to just re-run a specific step of a specific package, why
don't you use "make foo-build", "make foo-rebuild", etc. ?

It seems very hackish to extract the commands that Buildroot executes
to execute them outside the context of Buildroot. This doesn't really
help to make a case for accepting a patch like you're proposing. Could
you first convince us that there is a valid and reasonable use-case,
and then we can discuss how to support this use-case with Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
