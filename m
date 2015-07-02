From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 02 Jul 2015 17:32:55 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
	and theirs local dependencies
In-Reply-To: <5594FE06.5030900@syscom-instruments.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <2854682.pCSB3Zb5Zv@sagittea> <5594FE06.5030900@syscom-instruments.com>
Message-ID: <1909260.QcAQmjlMXM@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 02 July 2015 11:01:58 Viallard Anthony wrote:
> On 06/23/2015 09:56 AM, J?r?me Pouiller wrote:
> > Does this process would work?
> >
> >    rm build/*/.stamp_built
> >    make
> >
> >
> 
> Hi J?rome,
> 
> Yes. It can be a solution. I already did this way to rebuild package in 
> the old time when there wasn't the *-rebuild target command:
> 
> rm -rf output/build/clearsilver-0.10.5/.stamp_built && rm -rf 
> output/build/clearsilver-0.10.5/.stamp_configured
> 
> But I prefer an integrated mechanism in the makefile which make the 
> think more reliable and transparent :)

When I need very specific action for a project (generally 'run', 'check', 
'flash', etc...), I write a fragment of Makefile and a declare it in 
BR2_PACKAGE_OVERRIDE_FILE.

Therefore, you may add a local.mk file with:

local-rebuild:
	rm build/*/.stamp_built

...and maybe (not tested):

$(PACKAGES): local-rebuild



(Someday, I will post a patch to be able to display those local targets in 
'make help' output)


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
