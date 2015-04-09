From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:32:44 +0200
Subject: [Buildroot] [PATCH: buildroot-test 1/2] autobuild-run: do not
 build boost package with logging option enabled.
In-Reply-To: <1428610893-9224-1-git-send-email-romain.naour@openwide.fr>
References: <1428610893-9224-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150409233244.4010cd4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu,  9 Apr 2015 22:21:32 +0200, Romain Naour wrote:
> pthread_spin_* functions are not implemented in the uClibc used by this toolchain.
> 
> Fixes:
> http://autobuild.buildroot.net/results/664/6642dc9c569b2820a9d0e273fc2fb1d5a635ba0a/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Xtensa and ARC are not using NPTL, so by choosing my NPTL dependency
proposal, we don't need those patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
