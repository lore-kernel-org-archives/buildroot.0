From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 11:19:36 +0200
Subject: [Buildroot] [PATCH 13/16] erlang-jiffy: New package
In-Reply-To: <CAJtjsKa9mRtHaLjXcdbAi7w7_R=KNE3M_QSP-_SA=S=dGhqf1A@mail.gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-14-johan.oudinet@gmail.com>
 <20170531000729.2059186b@free-electrons.com>
 <CAJtjsKa9mRtHaLjXcdbAi7w7_R=KNE3M_QSP-_SA=S=dGhqf1A@mail.gmail.com>
Message-ID: <20170531111936.79596357@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 11:05:03 +0200, Johan Oudinet wrote:

> > Missing addition to the DEVELOPERS file. Please fix this in the 3
> > patches adding the 3 new packages.
> >  
> >> +ERLANG_JIFFY_VERSION = 0.14.8
> >> +ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
> >> +ERLANG_JIFFY_LICENSE = MIT  
> >
> > There are some parts under BSD-3c, and tests under yet another license.
> > This should be indicated here.  
> 
> Yep, the licensing of this package is a real mess. I'm not very
> competent in this stuff. What should I put in addition to MIT and
> BSD-3c?
> I didn't understand the "Google double-conversion" reference in the
> LICENSE file and the commit that introduces it does not give more
> explanations.

I guess something like:

ERLANG_JIFFY_LICENSE = MIT (core), BSD-3-Clause (Google double conversion library), BSD-3-Clause (tests)

is good enough.

> That's an error. Thanks for spotting it. I'm not using the features
> offered by this package in my ejabberd configuration, that's why I
> haven't seen this bug.

Wait. Does this means that Jiffy is not a mandatory dependency to build
ejabberd? If that's the case, then ejabberd should not select it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
