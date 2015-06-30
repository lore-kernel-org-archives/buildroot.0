From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 30 Jun 2015 10:38:49 +0200 (CEST)
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <20150630093903.4fd27ca5@free-electrons.com>
Message-ID: <1581556904.2327180.1435653528950.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> 
> Thanks a lot for giving more details about this. Indeed having a
> working example would be nice. However, I'm not entirely convinced
> this
> higher-level tabular format is really much more readable/useful than
> a
> pure Python solution. This higher-level tabular format remains in any
> case more limited than a real programming language, and it's a
> special
> syntax you have to learn, while Python is known by a large number of
> people already.
> 

We are in the process of reimplementing your examples in RFW to provide
some food for thought, stay tuned...

> But maybe I would be more convinced by some other features of RFW.
> What
> are its reporting capabilities?

pretty good, RFW can report in an xunit-compatible xml which can be
easily parsed by whatever tool you prefer. I have been autogenerating
reports with it for quite some time

RFW also generates some HTML pages ready to be pushed on a server,
but that's less usefull for the buildroot use-case.

An exemple of generated HTML can be found here:

http://robotframework.org/robotframework/latest/images/log_passed.html

> Can it run tests in parallel?

no, RFW core has no parallel testing capabilities by itself. There 
are plugins to do that, though...

> Can we
> easily integrate the tests with Jenkins to have them run everyday?

RFW has its own jenkins plugin to harness test results. integration
is very easy

the plugin is available here :

https://wiki.jenkins-ci.org/display/JENKINS/Robot+Framework+Plugin


> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
