From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 19 Jun 2016 20:05:20 +0530
Subject: [Buildroot] [PATCH] linux: allow the selection of the
 architecture's default configuration
In-Reply-To: <20160618150545.0f4b1131@free-electrons.com>
References: <1465899598-2855-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160618150545.0f4b1131@free-electrons.com>
Message-ID: <CA+G9fYu3q6T8WUzdYksG+7L=5HeoZpLM6rmvGJfayWDyUW1cVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 June 2016 at 18:35, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 14 Jun 2016 12:19:58 +0200, Thomas Petazzoni wrote:
>> To configure the Linux kernel, we currently provide two options:
>>
>>  1. Passing a defconfig name (for example "multi_v7"), to which we append
>>     "_defconfig" to run "make multi_v7_defconfig".
>>
>>  2. Passing a path to a custom configuration file.
>>
>> Unfortunately, those two possibilities do not allow to configure the
>> kernel when you want to use the default configuration built into the
>> kernel for a given architecture. For example, on ARM64, there is a
>> single defconfig simply called "defconfig", which you can load by
>> running "make defconfig".
>>
>> Using the mechanism (1) above doesn't work because we append
>> "_defconfig" automatically.
>>
>> One solution would be to change (1) and require the user to enter the
>> full defconfig named (i.e "multi_v7_defconfig" instead of "multi_v7"),
>> but we would break all existing Buildroot configurations.
>>
>> So instead, we add a third option, which simply tells Buildroot to use
>> the default configuration for the selected architecture. In this case,
>> Buildroot will configure the kernel by running "make defconfig".
>>
>> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>> This proposal aims at replacing:
>
> Applied to master. Thanks Yann for the review!

Well done !!!
Finally the patch is in master. I need not have to apply my local
patch any more.
Thomas, thanks for fine turning my proposed patches and make it more generic.
Thanks Yann for the review.

- Naresh

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
