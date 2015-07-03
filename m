From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 09:32:39 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: always build apps
In-Reply-To: <5595AF5A.9010500@mind.be>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <1434711274-49716-2-git-send-email-benoit@wsystem.com>
 <20150701111411.1dab82cc@free-electrons.com>
 <55950B29.9090200@wsystem.com>
 <20150702120402.4e4e3b9d@free-electrons.com>
 <5595A520.6090903@mind.be>
 <20150702232228.0ad1a03b@free-electrons.com>
 <5595AF5A.9010500@mind.be>
Message-ID: <20150703093239.60ff2be3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, 2 Jul 2015 23:38:34 +0200, Arnout Vandecappelle wrote:

> > However, do we really want to explicitly list all automatic optional
> > dependencies in the Config.in help text? I believe it would definitely
> > be hard to maintain. 
> 
>  Why is it hard to maintain? When you add an automatic dependency to the .mk
> file, add it to the Config.in as well. No biggie.

Well, just another thing to keep in sync. If we were to do that, then we
could just as well not do any automatic optional dependency, and always
have a Config.in sub-option to enable the dependency.

>  That said, I didn't mean that it should necessarily be added for everything.
> But certainly for things that are not immediately obvious. E.g. python support
> obviously requires python, openssl support is also pretty obvious. Although even
> there I wouldn't mind mentioning it in the help text.
> 
>  In this case, on the other hand, it's a tool called 'tsget' that needs perl -
> not so obvious.

True.

> > So the Config.in help text should probably be
> > mostly used for things that aren't clearly visible by reading the .mk
> > file. And automatic optional dependencies are usually pretty explicit
> > by looking at the .mk file.
> 
>  Ugh, I wouldn't like it if we expect from our users that they not only read all
> the .mk files of the packages they want to use, but also understand what it all
> means.

But in practice, it's very much the case today, due to these automatic
optional dependency handling that we use.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
