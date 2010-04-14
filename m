From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 17:01:47 +0200
Subject: [Buildroot] Question about external toolchain configuration
	"options"
In-Reply-To: <20100414165837.453af3a1@surf> (Thomas Petazzoni's message of
	"Wed, 14 Apr 2010 16:58:37 +0200")
References: <hq2d7t$5ut$1@dough.gmane.org>
	<201004132051.48176.yann.morin.1998@anciens.enib.fr>
	<20100414165837.453af3a1@surf>
Message-ID: <878w8qf57o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 Thomas> I think I'll use some hidden options like :

 Thomas> config BR2_TOOLCHAIN_HAS_IPV6
 Thomas> 	bool

 Thomas> All the packages should depend o n BR2_TOOLCHAIN_HAS_* options. And
 Thomas> then, internal toolchains configuration would do something like:

 Thomas> config BR2_BUILDROOT_TOOLCHAIN_ENABLE_IPV6
 Thomas> 	bool "Enable IPv6 support"
 Thomas> 	select BR2_TOOLCHAIN_HAS_IPV6

 Thomas> while external toolchain configuration would do something like:

 Thomas> config BR2_EXTERNAL_TOOLCHAIN_HAS_IPV6
 Thomas> 	bool "Toolchain has IPv6"
 Thomas> 	select BR2_TOOLCHAIN_HAS_IPV6

 Thomas> What do you think of this ?

That was my thought as well. Maybe reuse the existing symbols to limit
package churn.

-- 
Bye, Peter Korsgaard
