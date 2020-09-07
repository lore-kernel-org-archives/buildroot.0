From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Sep 2020 20:45:12 +0000
Subject: [Buildroot] [Bug 13181] libopenssl package enables Cryptodev engine
 even if BR2_PACKAGE_LIBOPENSSL_ENGINES is disabled
In-Reply-To: <bug-13181-163@https.bugs.busybox.net/>
References: <bug-13181-163@https.bugs.busybox.net/>
Message-ID: <bug-13181-163-4wZwpNEnbz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13181

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks for your bug report.

It is pretty common in Buildroot to enable an optional feature in a package
(here OpenSSL) if the dependencies needed for that feature (here cryptodev) are
available.

Do you have a practical situation where one cryptodev implementation
(BR2_PACKAGE_CRYPTODEV_LINUX or BR2_PACKAGE_OCF_LINUX) is enabled, but for some
reason OpenSSL cannot / should not use cryptodev ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
