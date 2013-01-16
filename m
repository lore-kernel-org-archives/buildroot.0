From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Jan 2013 15:11:45 +0100
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <20130116145510.66bdf069@skate> (Thomas Petazzoni's message of
 "Wed, 16 Jan 2013 14:55:10 +0100")
References: <1358351378-10876-1-git-send-email-bogdan@nimblex.net>
 <1358351378-10876-2-git-send-email-bogdan@nimblex.net>
 <20130116145510.66bdf069@skate>
Message-ID: <87622xmd3y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Bogdan Radulescu,
 Thomas> On Wed, 16 Jan 2013 15:49:38 +0000, Bogdan Radulescu wrote:

 >> +	select BR2_TOOLCHAIN_BUILDROOT_INET_IPV6

 Thomas> No, selecting toolchain options is not correct, and in this particular
 Thomas> case, it would only work for the internal toolchain backend (breaking
 Thomas> the external backend and Crosstool-NG backend).

 Thomas> See package/squid/Config.in for an example.

 Thomas> Basically, you must do something like:

 Thomas> config BR2_PACKAGE_FOO
 Thomas> 	depends on BR2_INET_IPV6

 Thomas> comment "foo requires IPv6 support in toolchain"
 Thomas> 	depends on !BR2_INET_IPV6

Indeed. Also don't forget to sign off on your patch (git commit -s).

-- 
Bye, Peter Korsgaard
