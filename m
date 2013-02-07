From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Feb 2013 16:28:18 +0100
Subject: [Buildroot] [PATCH 2/5] package: remove scripts listed in
 <pkg>_CONFIG_SCRIPTS from target
In-Reply-To: <5112F047.1010108@mind.be>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360192218-30930-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <5112F047.1010108@mind.be>
Message-ID: <CAHXCMMKnZ22YSrGqPe_2xGPEr7WBH5AhYmK_MwF7GGjj5SUxOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/2/7 Arnout Vandecappelle <arnout@mind.be>:
> On 07/02/13 00:10, Thomas Petazzoni wrote:
>>
>> The <foo>-config scripts are useless on the target, since they are
>> only needed for development, so we remove them automatically.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>

>
>
>> ---
>>   docs/manual/adding-packages-generic.txt |   11 ++++++++++-
>>   package/pkg-generic.mk                  |    5 +++++
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/manual/adding-packages-generic.txt
>> b/docs/manual/adding-packages-generic.txt
>> index 13d200d..1450907 100644
>> --- a/docs/manual/adding-packages-generic.txt
>> +++ b/docs/manual/adding-packages-generic.txt
>> @@ -90,6 +90,11 @@ The argument to be given to +LIBFOO_CONFIG_SCRIPTS+ is
>> the file name(s)
>>   of the shell script(s) needing fixing. All these names are relative to
>>   '$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
>>
>> +In addition, the scripts listed in +LIBFOO_CONFIG_SCRIPTS+ are removed
>> +from +$(TARGET_DIR)/usr/bin+ if they are not needed (i.e, when the
>> +installation of development files on the target has not been selected,
>> +which is the default).
>
>
>  I wouldn't document deprecated things. So just remove "if they are not
> needed ...".
I tend to agree with Arnout.

Regards,

-- 
Samuel
