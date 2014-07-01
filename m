From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2014 13:29:57 +0200
Subject: [Buildroot] [PATCH] wget: Depends on libuuid
In-Reply-To: <5869200.uCiIhCFC8h@aspotashev> (Alexander Potashev's message of
 "Tue, 01 Jul 2014 14:12:44 +0400")
References: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
 <2414587.c08SQIiSAD@aspotashev> <20140701100727.GN4425@tarshish>
 <5869200.uCiIhCFC8h@aspotashev>
Message-ID: <87bnt9iafe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Potashev <a.potashev@geoscan.aero> writes:

 > Hi Baruch,
 > ? ?????? ?? 1 ???? 2014 13:07:27 ?? ????????:
 >> On Tue, Jul 01, 2014 at 01:55:35PM +0400, Alexander Potashev wrote:
 >> > Looks good, although one could argue if keeping *_DEPENDENCIES up-to-date
 >> > is important when we also have dependency assurance in Config.in.
 >> 
 >> No. These are two different levels of dependencies. Config.in 'select'
 >> determines which packages are to be built. You need this for mandatory
 >> dependencies. The per package $(PKG)_DEPENDENCIES determines the ORDER of
 >> the build. $(PKG)_DEPENDENCIES should list both mandatory AND optional
 >> dependencies to get a reproducible result.

 > Thanks for clarification! Now I see the change suggested by Thomas is 
 > important.

Great, I've committed a patch adding the optional libuuid
depency. Thanks.

-- 
Bye, Peter Korsgaard
