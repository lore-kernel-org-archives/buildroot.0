From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Oct 2015 10:20:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Add node.js v4.1.2
In-Reply-To: <1444136239-22044-1-git-send-email-jaap@jcz.nl> (Jaap Crezee's
 message of "Tue, 6 Oct 2015 14:57:19 +0200")
References: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
Message-ID: <87612jnl7c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jaap" == Jaap Crezee <jaap@jcz.nl> writes:

 > Signed-off-by: Jaap Crezee <jaap@jcz.nl>
 > ---
 >  ...01-Remove-dependency-on-Python-bz2-module.patch | 31 ++++++++++++++++++++++
 >  package/nodejs/Config.in                           |  5 ++++
 >  package/nodejs/nodejs.hash                         |  3 +++
 >  3 files changed, 39 insertions(+)
 >  create mode 100644 package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch

 > +++ b/package/nodejs/Config.in
 > @@ -40,12 +40,17 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
 >  	bool "v0.12.7"
 >  	depends on !BR2_ARM_CPU_ARMV5
 
 > +config BR2_BR2_PACKAGE_NODEJS_4_1_X
 > +	bool "v4.1.2"
 > +	depends on !BR2_ARM_CPU_ARMV5
 > +
 >  endchoice
 
 >  config BR2_PACKAGE_NODEJS_VERSION_STRING
 >  	string
 >  	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 >  	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 > +	default "4.1.2"     if BR2_BR2_PACKAGE_NODEJS_4_1_X

Is there a need to keep both 0.12.x and 4.1.x? The only reason we have a
version selection is afaik that <ARMv7 is only supported in the old
0.10.x version.

-- 
Bye, Peter Korsgaard
