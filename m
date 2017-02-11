From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 11 Feb 2017 18:53:37 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] poco: build it as "poco", not "poco-poco"
In-Reply-To: <20170211164837.26d4de3c@free-electrons.com>
References: <1486771153-10386-1-git-send-email-casantos@datacom.ind.br>
 <c56b756cdb1ca9426d7a9ec5d04ba9462c6d4006.1486811718.git.casantos@datacom.ind.br>
 <20170211164837.26d4de3c@free-electrons.com>
Message-ID: <973457531.9979623.1486846417369.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "bernd kuhls" <bernd.kuhls@t-online.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>, "Peter
> Korsgaard" <peter@korsgaard.com>
> Sent: Saturday, February 11, 2017 1:48:37 PM
> Subject: Re: [Buildroot] [PATCH v2] poco: build it as "poco", not "poco-poco"

> Hello,
> 
> On Sat, 11 Feb 2017 09:15:55 -0200, Carlos Santos wrote:
> 
>> -POCO_VERSION = poco-1.7.2-release
>> -POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
>> +POCO_VERSION = 1.7.2
>> +POCO_VERSION_TAG = poco-$(POCO_VERSION)-release
>> +POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION_TAG))
> 
> In all packages, we currently use directly the upstream tag name as the
> <pkg>_VERSION value. I.e, we already had some people who wanted to do:
> 
> FOO_VERSION = 1.2.3
> FOO_SITE = $(call github,foo,bar,v$(FOO_VERSION))
> 
> and we said no, the version should be v1.2.3.
> 
> So I'm not sure why we would want to do this differently for the poco
> package. Yes, poco-poco-1.7.2-release seems weird, but if you find this
> weird, then it's upstream who should change the name of their tags.

They would probably interpret such request as me asking them to
scratch my itches (just like you are probably feeling now, sorry).

> That being said, one thing that might lead us to change our mind is
> when we will do tracking of new upstream releases. In this situation,
> it might be easier to have a "cleaner" <pkg>_VERSION variable. See for
> example the list of versions visible at
> https://release-monitoring.org/project/5418/.

Right. That "poco" and "release" prefix/suffix in the tag are mere
embellishments. In fact I sent this change because when the poco
compilation stated to fail on our multicore autobuilders (see commit
126162b9159a185ac1897db1a9956f0379fc1428) people here asked me to fix
that "poco-poco" issue.

They really thought that the package name was "poco-poco", due to the
build log (see the last three lines in http://bit.ly/2lw46Dl) and
during my tests I even attempted a "make poco-poco-rebuild", which
obviously failed with a "No rule to make target 'poco-poco-rebuild'"
error. That's really annoying.

> Thomas

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
