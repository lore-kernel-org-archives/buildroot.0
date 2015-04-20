From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Apr 2015 22:00:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7971] python-flask,
	python-werkzeug. No module named zlib
In-Reply-To: <bug-7971-163@https.bugs.busybox.net/>
References: <bug-7971-163@https.bugs.busybox.net/>
Message-ID: <20150420220016.22065819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7971

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-20 22:00:15 UTC ---
I am using a fr_FR.UTF-8 system. I've built the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_FLASK=y

And Flask can be imported just fine:

Welcome to Buildroot
buildroot login: root
# python
>>> from flask import Flask
>>> 

So I cannot reproduce the bug reported by Nikita.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
