From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Sep 2007 23:46:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20070919080338.GB11856@aon.at>
References: <20070918171058.7CCA9A495E@busybox.net>
	<1190149731.4516.15.camel@aeglos.sweden.atmel.com>
	<20070919080338.GB11856@aon.at>
Message-ID: <1190238418.7740.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-09-19 klockan 10:03 +0200 skrev Bernhard Fischer:
> On Tue, Sep 18, 2007 at 11:08:51PM +0200, Ulf Samuelsson wrote:
> >tis 2007-09-18 klockan 10:10 -0700 skrev aldot at uclibc.org:
> >> Author: aldot
> >> Date: 2007-09-18 10:10:56 -0700 (Tue, 18 Sep 2007)
> >> New Revision: 19878
> >> 
> >> Log:
> >> - patch the correct dir
> >> 
> >> 
> >> Modified:
> >>    trunk/buildroot/target/linux/Makefile.in
> >> 
> >> 
> >> Changeset:
> >> Modified: trunk/buildroot/target/linux/Makefile.in
> >> ===================================================================
> >> --- trunk/buildroot/target/linux/Makefile.in	2007-09-18 13:12:25 UTC (rev 19877)
> >> +++ trunk/buildroot/target/linux/Makefile.in	2007-09-18 17:10:56 UTC (rev 19878)
> >> @@ -129,7 +129,7 @@
> >>  		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
> >>  endif
> >>  ifeq ($(BR2_PACKAGE_OPENSWAN),y)
> >> -	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
> >> +	toolchain/patch-kernel.sh $(LINUX26_DIR) package/openswan \
> >>  		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
> >>  endif
> >>  ifneq ($(LINUX26_PATCH_DIR),)
> >
> >Thanks,
> >Openswan is a mess at the moment, with *large* duplicate patches
> >(adding 6-8 MBytes to the trunk).
> 
> I don't need the old patches anymore, but it was you who wanted to
> retain deprecated stuff.. Feel free to wipe the old ones.
> 
> >I think we should download the klips/natt patches from the website
> >instead, and patches should be based on a user selected version.
> 
> The patches for 2.4.9 need fixes to apply and work cleanly, so this is
> not an option.

I tried, and noticed that there were proplems, 
but it seems to me that only the "natt" patches have
problem, and they are pretty small.
"klips" patches seems to apply without problem.
This is good since the "klips" patches are the big un's.

Are you aware of any changes needed to klips?

BR
Ulf Samuelsson
