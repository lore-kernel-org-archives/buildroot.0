From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Wed, 06 Jul 2016 08:13:43 +1000
Subject: [Buildroot] [PATCH v3 2/6] Add documentation for merged
 defconfigs
In-Reply-To: <20160705193212.GB20922@asimov.austin.ibm.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>	
 <fb148ddadbc12c9a9437192761ba342237a27325.1467176798.git.sam.bobroff@au1.ibm.com>	
 <489e6359-291e-5920-87d6-da23fe8c5d0a@smile.fr>
 <20160705193212.GB20922@asimov.austin.ibm.com>
Message-ID: <1467756823.4917.1.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2016-07-05 at 14:32 -0500, Patrick Williams wrote:
> On Fri, Jul 01, 2016 at 03:18:58PM +0200, Romain Naour wrote:
> > Hi Sam,
> > 
> > This series has been discussed with other developers and we concluded that this
> > feature is not the responsibility of Buildroot to generate a defconfig from
> > partial configuration files.
> > 
> > Instead we recommend to use merge_config.sh from outside of Buildroot to
> > generate the merged defconfig before calling make. Maybe we should add some
> > documentation in the manual to explain how to use it.
> > 
> > Best regards,
> > Romain
> > 
> 
> Earlier we had two independent patch sets that we were asked to merge.
> 
>    1) Merged defconfigs (now this patch set).
>    2) Subdirs for defconfigs.
> 
> If #1 has been rejected as undesireable, should we now prepare an
> indepenent patch set for #2 or is that also not wanted now?
> 
> There is currently no way for us to manage this behavior in a
> BR2_EXTERNAL layer alone because there is no Makefile from the
> BR2_EXTERNAL path sourced in the defconfig case.  Is there any issue
> with a patch that will source a file like $(BR2_EXTERNAL)/external-defconfig.mk?

Actually there might be - Sam was telling me yesterday that the main
Makefile includes?$(BR2_EXTERNAL)/external.mk, which is something we may
use to get mergeconfigs in op-build. That might work for nested configs
as well.

> 
> I realize we could have a new script, but we already have users that are
> use to 'make <system>_defconfig && make' so we would like to be able to
> preserve that behavior even though we are moving to merged defconfig
> fragments.
> 
