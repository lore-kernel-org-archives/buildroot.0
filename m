From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 16:48:37 +0100
Subject: [Buildroot] [PATCH v2] poco: build it as "poco", not "poco-poco"
In-Reply-To: <c56b756cdb1ca9426d7a9ec5d04ba9462c6d4006.1486811718.git.casantos@datacom.ind.br>
References: <1486771153-10386-1-git-send-email-casantos@datacom.ind.br>
 <c56b756cdb1ca9426d7a9ec5d04ba9462c6d4006.1486811718.git.casantos@datacom.ind.br>
Message-ID: <20170211164837.26d4de3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Feb 2017 09:15:55 -0200, Carlos Santos wrote:

> -POCO_VERSION = poco-1.7.2-release
> -POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
> +POCO_VERSION = 1.7.2
> +POCO_VERSION_TAG = poco-$(POCO_VERSION)-release
> +POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION_TAG))

In all packages, we currently use directly the upstream tag name as the
<pkg>_VERSION value. I.e, we already had some people who wanted to do:

FOO_VERSION = 1.2.3
FOO_SITE = $(call github,foo,bar,v$(FOO_VERSION))

and we said no, the version should be v1.2.3.

So I'm not sure why we would want to do this differently for the poco
package. Yes, poco-poco-1.7.2-release seems weird, but if you find this
weird, then it's upstream who should change the name of their tags.

That being said, one thing that might lead us to change our mind is
when we will do tracking of new upstream releases. In this situation,
it might be easier to have a "cleaner" <pkg>_VERSION variable. See for
example the list of versions visible at
https://release-monitoring.org/project/5418/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
