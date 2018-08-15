From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 09:37:49 +0200
Subject: [Buildroot] [PATCH 1/8] package/mender: update legal info
In-Reply-To: <0d11b4c6-40ac-5a3a-69d4-a1dda529d43f@mind.be>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-2-mirza.krak@northern.tech>
 <0d11b4c6-40ac-5a3a-69d4-a1dda529d43f@mind.be>
Message-ID: <CADHdJwB78Mo5rtpQk0e6OhkAzdcGPvkz_iRu4AcWcSwB68z2Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 1:32 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Mirza,

Hi Arnout,

>
> On 15-08-18 01:13, Mirza Krak wrote:
>> And also added license checksums in mender.hash
>>
>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>> ---
>>  package/mender/mender.hash | 4 ++++
>>  package/mender/mender.mk   | 2 ++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/package/mender/mender.hash b/package/mender/mender.hash
>> index 30a04fad7a..6a8bb5795b 100644
>> --- a/package/mender/mender.hash
>> +++ b/package/mender/mender.hash
>> @@ -1,2 +1,6 @@
>>  # Locally computed:
>>  sha256 267fa73ad472b034248ee298593b5c52ea0b105fd73c91febb3587280c61bee2 mender-1.4.0.tar.gz
>> +
>> +# License, locally computed
>> +sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 LICENSE
>> +sha256 54d6f54a2815cc2e3cef4f7dde5a3aae20f09b2cde394d8d3f1dce5d8a79d738 LIC_FILES_CHKSUM.sha256> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
>> index 695b5e7a91..0dad93be28 100644
>> --- a/package/mender/mender.mk
>> +++ b/package/mender/mender.mk
>> @@ -6,6 +6,8 @@
>>
>>  MENDER_VERSION = 1.4.0
>>  MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
>> +MENDER_LICENSE = Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT & OLDAP-2.8
>
>  Although & is probably the proper delimiter to use for AND in SPDX format, we
> currently use ", " everywhere, so please stick to that.

Got it, thanks.


>> +MENDER_LICENSE_FILES = LICENSE LIC_FILES_CHKSUM.sha256
>
>  Instead of LIC_FILES_CHKSUM.sha256, we should actually include all the files
> mentioned in there in our license list. Well, actually, we can optimize it a
> little bit because there are some identical files.
>
>  Alternatively, you could include all of them, and for the .hash file you can
> just prepend 'sha256  ' to every line of LIC_FILES_CHKSUM.sha256 and append it
> to the .hash file, with the comment
>
> # From LIC_FILES_CHKSUM.sha256
>
>
>  On second thought, actually it is a good idea to include
> LIC_FILES_CHKSUM.sha256 as well, to detect when a new subpackage with a new
> license is added.

I would really like to keep this as-is to avoid a heavy maintenance
burden. This file is maintained in the upstream package and would
rather not duplicate the work by extracting the information from
LIC_FILES_CHKSUM.sha256 to put it in mender.hash.

The checksum check of LIC_FILES_CHKSUM.sha256 will handle the sanity
check of the LICENSE files, and all the licenses that are in
LIC_FILES_CHKSUM.sha256 are already mentioned in the mender.mk file:

     MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, MIT, OLDAP-2.8

This should cover it. Or are there any big drawbacks with this
approach that I am not seeing?

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
