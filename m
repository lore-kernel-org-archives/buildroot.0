From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:06:52 +0200
Subject: [Buildroot] [PATCH] ntp: fix build without libcap and no threads
In-Reply-To: <a90754470c0613a6f8c9ccce674ff0c82299483e.1539628708.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 15 Oct 2018 21:38:28 +0300")
References: <a90754470c0613a6f8c9ccce674ff0c82299483e.1539628708.git.baruch@tkos.co.il>
Message-ID: <87k1m8dzzn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > When threads support is missing the ntp build system builds the
 > work_fork code. This code added call to set_user_group_ids() that is
 > under HAVE_DROPROOT, which is disabled when libcap is not built.

 > Add a patch fixing that.

 > Fixes:
 > http://autobuild.buildroot.net/results/ab9/ab9ceff1151b8b5e6b9fa77d39c0f9b0cac1a080/

 > Cc: Artyom Panfilov <apanfilov@spectracom.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
