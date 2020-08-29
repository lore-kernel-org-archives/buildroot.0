From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 18:35:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: disable cryptsetup for
 host package
In-Reply-To: <20200829135941.1862456-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Aug 2020 15:59:40 +0200")
References: <20200829135941.1862456-1-fontaine.fabrice@gmail.com>
Message-ID: <871rjpif4v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build with cryptsetup and without libblkid will fail on:
 > ../src/shared/dissect-image.c:1336:34: error: 'N_DEVICE_NODE_LIST_ATTEMPTS' undeclared (first use in this function)
 >  1336 |         for (unsigned i = 0; i < N_DEVICE_NODE_LIST_ATTEMPTS; i++) {
 >       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~

 > This bug has been reported upstream:
 > https://github.com/systemd/systemd/pull/16901
 > and is not an issue for the target variant as libblkid is select by
 > BR2_PACKAGE_UTIL_LINUX_MOUNT

 > As cryptsetup does not seem needed for host-systemd, just disable it

 > Fixes:
 >  - http://autobuild.buildroot.org/results/67782c225c08387c1bbcbea9eee3ca12bc6577cd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
