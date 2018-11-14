From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Nov 2018 09:24:32 +0100
Subject: [Buildroot] [PATCH v3 2/3] test-pkg: Use the correct config
 prefix when merging
In-Reply-To: <20181114074838.GA12239@smart-All-Series>
References: <20181114071156.10453-1-afshin.nasser@gmail.com>
 <20181114071156.10453-3-afshin.nasser@gmail.com>
 <20181114071731.GA22153@dell5510> <20181114074838.GA12239@smart-All-Series>
Message-ID: <bfcad053-5720-84af-1530-b188056f7fd0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nasser,

 Two remarks for your future contributions.

On 14/11/2018 08:49, Nasser Afshin wrote:
> Hi Petr
> On Wed, Nov 14, 2018 at 08:17:33AM +0100, Petr Vorel wrote:
>> Hi Nasser,
>>
>>> From: Nasser Afshin <Afshin.Nasser@gmail.com>
>>
>>> We should use an empty prefix as we do not have any prefix.
>>> Note that BR2_ is mere a convention.
>>
>>> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>

 When you send a v2 or later, please include a patch changelog, like so:

---
v2: remove quotes from the empty CONFIG_ assignment (suggested by Peter Vorel)


 The --- splits the commit message from additional notes that won't be included
when the patch is applied.

>> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Sorry I forgot to mention that. Resent.

 There is no need to resend for that: patchwork will include it automatically.


 Regards,
 Arnout

>>> ---
>>>  utils/test-pkg | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>> diff --git a/utils/test-pkg b/utils/test-pkg
>>> index aa91ee02cf..e4f68ed061 100755
>>> --- a/utils/test-pkg
>>> +++ b/utils/test-pkg
>>> @@ -129,7 +129,7 @@ build_one() {
>>
>>>      mkdir -p "${dir}"
>>
>>> -    support/kconfig/merge_config.sh -O "${dir}" \
>>> +    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
>> Thanks for a change.
>>
>>
>> Kind regards,
>> Petr
> Kind regards,
> Nasser
> 
