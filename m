From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 22:20:10 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
In-Reply-To: <CAPi7W808osYXWuNs8URXOdOix6eP4P46+ESrH+DuaR6syRLz5A@mail.gmail.com>
References: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
 <20180818174900.0ee2b668@windsurf>
 <20180818212953.26bf3a2f@windsurf>
 <CAPi7W808osYXWuNs8URXOdOix6eP4P46+ESrH+DuaR6syRLz5A@mail.gmail.com>
Message-ID: <20180818222010.17f19f75@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 22:09:13 +0200, Fabrice Fontaine wrote:

> OK, this last one is easy, azmq selects BOOST_LOG but BOOST_LOG depends on
> !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC):
> 
> warning: (BR2_PACKAGE_AZMQ) selects BR2_PACKAGE_BOOST_LOG which has unmet
> direct dependencies (BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_HAS_THREADS_NPTL &&
> (!BR2_powerpc || !BR2_TOOLCHAIN_USES_UCLIBC))
> 
> I will fix this by removing the dependency on !(BR2_powerpc &&
> BR2_TOOLCHAIN_USES_UCLIBC) from BOOST_LOG as it seems that boost-log builds
> fine on powerpc with uclibc nowadays.

OK. This was added by me in commit
7aaa9bee2e6009c6c00fa2a356b8f014999e9a54. There was no clear
explanation of the problem, it was just "it doesn't build, and nobody
cares". And it was 3 years ago, so there are high chances that the
problem has been fixed either in uClibc or in Boost. So let's try to
remove this dependency indeed. Waiting for your patch!

(BTW, you still haven't joined IRC! :-))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
