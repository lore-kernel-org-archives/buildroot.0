From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 22 Dec 2019 12:58:40 +0100
Subject: [Buildroot] [git commit] package/kf5-kcoreaddons: fix
 check-package warnings
In-Reply-To: <20191222103746.GV26395@scaer>
References: <20191222094810.736238D4B7@busybox.osuosl.org>
 <54507372-d73f-2f05-456c-9efe819eda0d@benettiengineering.com>
 <20191222103746.GV26395@scaer>
Message-ID: <ebdf3d7c-66c0-fbb1-4988-e748b03303d2@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/22/19 11:37 AM, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2019-12-22 11:23 +0100, Giulio Benetti spake thusly:
>> On 12/22/19 10:57 AM, Yann E. MORIN wrote:
>>> commit: https://git.buildroot.net/buildroot/commit/?id=f7e750e8f514f84bf2f4fc99976dd11f19c8ecbc
>>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>>
>>> KF5_KCOREADDONS_CONF_OPTS is set both outside and inside the
>>> conditional block, so the value set outside would be lost if
>>> the condition were to be true.
>>>
>>> Use append-assignement in this case, as reported by check-package.
>>>
>>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>>
>> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Thanks, but that was a commit, so your reviewed-by tag won't be
> stored... :-/

Oops, right.

Thanks for fixing
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> Best regards
>> -- 
>> Giulio Benetti
>> Benetti Engineering sas
>>
>>> ---
>>>   package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
>>> index 5b3e9acd90..76be8876cc 100644
>>> --- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
>>> +++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
>>> @@ -23,7 +23,7 @@ KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOREADDONS_CXXFLAGS)"
>>>   ifeq ($(BR2_microblaze),y)
>>>   # Microblaze ld emits warnings, make warnings not to be treated as errors
>>> -KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
>>> +KF5_KCOREADDONS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
>>>   endif
>>>   $(eval $(cmake-package))
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
> 
