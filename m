From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 15:41:47 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180206134647.fksog42sz7wgpq4w@tarshish> (Baruch Siach's
 message of "Tue, 6 Feb 2018 15:46:47 +0200")
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
 <cfa2c67c-d3c8-81cd-7f50-60de1834d1ed@mind.be>
 <20180206105019.tqnsw3i5l44mt5vs@tarshish>
 <87d11itepn.fsf@dell.be.48ers.dk>
 <20180206134647.fksog42sz7wgpq4w@tarshish>
Message-ID: <874lmutc2c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Possibly, yes. Lets see how much blows up on next. Do you know if (some
 >> of) these issues are also fixed on the 2.26 branch?

 > As far as I know all these issues are fixed in the 2.26 stable branch. See the 
 > NEWS file in that branch.

Ok, but only when we bump to the latest version on the 2.26 branch
- E.G.:

git diff 73a92363619e52c458146e903dfb9b1ba823aa40.. -- NEWS

  CVE-2017-1000408: Incorrect array size computation in _dl_init_paths leads
  to the allocation of too much memory.  (This is not a security bug per se,
  it is mentioned here only because of the CVE assignment.)  Reported by
  Qualys.

  CVE-2017-1000409: Buffer overflow in _dl_init_paths due to miscomputation
  of the number of search path components.  (This is not a security
  vulnerability per se because no trust boundary is crossed if the fix for
  CVE-2017-1000366 has been applied, but it is mentioned here only because
  of the CVE assignment.)  Reported by Qualys.

  CVE-2017-16997: Incorrect handling of RPATH or RUNPATH containing $ORIGIN
  for AT_SECURE or SUID binaries could be used to load libraries from the
  current directory.

  CVE-2018-1000001: Buffer underflow in realpath function when getcwd function
  succeeds without returning an absolute path due to unexpected behaviour
  of the Linux kernel getcwd syscall.  Reported by halfdog.

I don't see any reference to CVE-2018-6485 though.

I'll send a patch to bump the version.

-- 
Bye, Peter Korsgaard
