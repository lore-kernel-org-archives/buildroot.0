From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jun 2021 14:15:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-06-27
In-Reply-To: <CAHp75VfAoLq1HEDdh+3ZNhrF-+upsQN1cPu8z3+4jMG6caEQ=Q@mail.gmail.com>
References: <60d962ee.1c69fb81.dd5ce.3e2dSMTPIN_ADDED_MISSING@mx.google.com>
 <CAHp75VfAoLq1HEDdh+3ZNhrF-+upsQN1cPu8z3+4jMG6caEQ=Q@mail.gmail.com>
Message-ID: <20210628141514.67c4957b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andy,

On Mon, 28 Jun 2021 12:11:03 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> >              name              | found by |        link to release-monitoring.org        |   version    |   upstream
> > -------------------------------+----------+----------------------------------------------+--------------+--------------
> >                    fb-test-app |  DISTRO  | https://release-monitoring.org/project/206162 | rosetta-1... | 1.0.0  
> 
> Anything I should do?

Yes:

 (1) Change the release-monitoring.org entry so that it drops the
     "rosetta-" prefix from the version numbers, and ask the
     release-monitoring.org maintainers to refresh the fb-test-app
     entry.

 (2) Change the Buildroot fb-test-app package to not have "rosetta-" in
     the <pkg>_VERSION variable, but only in the <pkg>_SITE variable. You
     will find lots of other github-fetched packages in this situation,
     for example:

AZMQ_VERSION = 1.0.2
AZMQ_SITE = $(call github,zeromq,azmq,v$(AZMQ_VERSION))

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
