From: Mirza Krak <mirza.krak@northern.tech>
Date: Thu, 16 Aug 2018 21:59:59 +0200
Subject: [Buildroot] [PATCH 1/8] package/mender: update legal info
In-Reply-To: <1377b705-71cf-3649-5bf1-f31a307d74fd@mind.be>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-2-mirza.krak@northern.tech>
 <0d11b4c6-40ac-5a3a-69d4-a1dda529d43f@mind.be>
 <CADHdJwB78Mo5rtpQk0e6OhkAzdcGPvkz_iRu4AcWcSwB68z2Mw@mail.gmail.com>
 <1377b705-71cf-3649-5bf1-f31a307d74fd@mind.be>
Message-ID: <CADHdJwBhDUZx8UwV4NML4LGfBcWZ_mnBme9VmX8sSS5U=WJvoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 16, 2018 at 5:36 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 15/08/2018 09:37, Mirza Krak wrote:
>> On Wed, Aug 15, 2018 at 1:32 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>  Hi Mirza,
>>
>> Hi Arnout,
>>
>>>
>>> On 15-08-18 01:13, Mirza Krak wrote:
>
> [snip]
>>>> +MENDER_LICENSE_FILES = LICENSE LIC_FILES_CHKSUM.sha256
>>>
>>>  Instead of LIC_FILES_CHKSUM.sha256, we should actually include all the files
>>> mentioned in there in our license list. Well, actually, we can optimize it a
>>> little bit because there are some identical files.
>>>
>>>  Alternatively, you could include all of them, and for the .hash file you can
>>> just prepend 'sha256  ' to every line of LIC_FILES_CHKSUM.sha256 and append it
>>> to the .hash file, with the comment
>>>
>>> # From LIC_FILES_CHKSUM.sha256
>>>
>>>
>>>  On second thought, actually it is a good idea to include
>>> LIC_FILES_CHKSUM.sha256 as well, to detect when a new subpackage with a new
>>> license is added.
>>
>> I would really like to keep this as-is to avoid a heavy maintenance
>> burden. This file is maintained in the upstream package and would
>> rather not duplicate the work by extracting the information from
>> LIC_FILES_CHKSUM.sha256 to put it in mender.hash.
>>
>> The checksum check of LIC_FILES_CHKSUM.sha256 will handle the sanity
>> check of the LICENSE files, and all the licenses that are in
>> LIC_FILES_CHKSUM.sha256 are already mentioned in the mender.mk file:
>>
>>      MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, MIT, OLDAP-2.8
>>
>> This should cover it. Or are there any big drawbacks with this
>> approach that I am not seeing?
>
>  Well, we really want to collect the license text for all applicable licenses.
> So you should include at least one file for each license mentioned in
> MENDER_LICENSE. Since the checksums are already available, I thought the easiest
> would be to create part of the hash file from the existing file. Like:
>
> # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
> # Apache-2.0 license.
> sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  LICENSE

Got it, and thanks for providing the "sed magic" :).

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
