From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 22 Jan 2020 19:16:25 +0100
Subject: [Buildroot] [PATCH] libnss: Re-add ZLIB_INCLUDE_DIR varible
In-Reply-To: <5337c66e-881d-2eb9-bde6-e5b185b68741@benettiengineering.com>
References: <20200122164450.17963-1-thomas.preston@codethink.co.uk>
 <5337c66e-881d-2eb9-bde6-e5b185b68741@benettiengineering.com>
Message-ID: <6adeec84-1148-d926-13f5-5664b99ac2bf@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to mention that commit title should start with 
"package/libnss:..." instead of just "libnss", but maybe the committer 
could ammend it just before committing.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

On 1/22/20 6:39 PM, Giulio Benetti wrote:
> Hi Thomas,
> 
> On 1/22/20 5:44 PM, Thomas Preston wrote:
>> The libnss patch adding ZLIB_INCLUDE_DIR is added to upstream on
>> 2020-01-07 but the 3.49.1 release on 2020-01-13 does not contain this
>> patch, so we have actually prematurely removed it from Buildroot.
>>
>> This only affects host-libnss when libzlib is not installed in the host
>> system. When building for the target, the toolchain-wrapper already
>> looks in the target sysroot default include path - where zlib.h is
>> installed.
>>
>> Re-add this patch, so that we can build host-libnss 3.49.1.
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> 
> You're right, it is because version 3.49.1 is not in master branch, so
> this will be fixed bumping to 3.50 when they release it(2020-02-07
> according to [1]).
> 
> Anyway I've built successfully with this buildroot patch and it builds
> correctly, so:
> 
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> And thank you :-)
> 
> [1]: https://wiki.mozilla.org/NSS:Release_Versions
> 
> Best regards
> 
