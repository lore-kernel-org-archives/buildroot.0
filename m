From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jun 2012 09:48:38 +0200
Subject: [Buildroot] [PATCH 10/10] toolchain-external: on SuperH,
	use Sourcery CodeBench 2011.09 by default
In-Reply-To: <7a2800c2cb33d674a82e1396354225549458a708.1338732273.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Jun 2012 16:04:44 +0200")
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <7a2800c2cb33d674a82e1396354225549458a708.1338732273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ehpvsejt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The 2012.03 version of the x86 toolchain uses glibc 2.15, which
 Thomas> doesn't provide RPC functions. This breaks most packages for now,
 Thomas> until we package TI-RPC properly.

Seems like cut'n'paste from patch 9.

"Most packages" is probably somewhat exaggerated - We have very few
packages depending on BR2_INET_RPC:

git grep -l BR2_INET_RPC package/**/Config.in
package/lmbench/Config.in
package/netkitbase/Config.in
package/netkittelnet/Config.in
package/nfs-utils/Config.in
package/portmap/Config.in

Or have you found other packages where we're missing the BR2_INET_RPC
annotation?

-- 
Bye, Peter Korsgaard
