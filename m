From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jul 2016 13:58:07 +0200
Subject: [Buildroot] [PATCH 2/3] package/rt-tests: bump to 1.0
In-Reply-To: <20160715150422.5da4a111@free-electrons.com>
References: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
 <1468522869-3887-2-git-send-email-romain.naour@gmail.com>
 <20160715150422.5da4a111@free-electrons.com>
Message-ID: <6212cf57-3d62-614d-4188-3afb603e76a7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 15/07/2016 ? 15:04, Thomas Petazzoni a ?crit :
> Hello,
> 
> One quick comment on this patch.
> 
> On Thu, 14 Jul 2016 21:01:08 +0200, Romain Naour wrote:
> 
>> +Subject: [PATCH 1/2] Fix various minor issues with rt-tests build system
> 
>> +Subject: [PATCH 2/2] Fix a build issue with uClibc-ng
> 
> Please use "git format-patch -N" when generating patches for Buildroot
> packages, in order to avoid the 1/2 and 2/2 specifications. These
> specifications very quickly get wrong when we add or remove patches, so
> we prefer not to have them.

Agree, I just forgot about patch numbering.

I noticed a build issue with this new version of rt-tests [1] due to local
syscall number definition for the new kernel deadline scheduler on some
architectures. Upsteam added __NR_sched_setattr and __NR_sched_setattr
definition for common architectures (x86, x86_64, arm) and tile if not already
defined [2].

Maybe instead of adding missing syscall number, we can avoid building rt-tests
with toolchain compiled with too old kernel headers (i.e
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14)

Thoughts ?

Best regards,
Romain

[1]
http://autobuild.buildroot.net/results/6fa/6facaeb10588bdf3ff029b882a8ae6ffba815cdc
[2]
https://kernel.googlesource.com/pub/scm/utils/rt-tests/rt-tests.git/+/ef2dee4232b7cae594ef7ecb7230c4bd18cea3f3%5E%21/

> 
> Thanks,
> 
> Thomas
> 
