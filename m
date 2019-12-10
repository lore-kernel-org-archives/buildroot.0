From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 10 Dec 2019 14:23:02 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 powerpc without <sys/auxv.h>
In-Reply-To: <20191210140949.72b3cf96@windsurf>
References: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
 <20191210140949.72b3cf96@windsurf>
Message-ID: <3e33365c-5e48-b5c7-f67f-74e60c93d4c8@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/10/19 2:09 PM, Thomas Petazzoni wrote:
> On Tue, 10 Dec 2019 13:13:22 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add patch to fix build failure on PowerPc without <sys/auxv.h>. The patch
>> inserts #if statements to include or note <sys/auxv.h> prior it exists.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/8bf95bd8a0aec8c53889308ab1e00d0a94f53d57/
> 
> When is this header file available/not available? Is it a glibc vs.
> musl vs. uClibc thing? Something else?
> 
> I'm not really a big fan of solutions that simply consist in "it wants
> this file, this file is not available, so let's make it ignore it",
> without a deeper investigation.

Upstream already use this solution in the same file, i.e. arm/aarch64:
https://hg.mozilla.org/projects/nss/file/tip/lib/freebl/blinit.c#l100

and only if <sys/auxv.h> is present then they probe with getauxval() to 
check which HWCAP_ is present, otherwise they consider(i.e.) 
arm_neon_support not present, that is not true in any case. But at the 
time of this writing they seem to consider this enough, probably they 
will improve it later.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Thomas
> 
