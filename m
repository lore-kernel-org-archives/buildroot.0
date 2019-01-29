From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Jan 2019 12:27:54 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <20190129102608.4k3wfli3dyomb7aa@debby>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128170533.16555-1-joakim.bech@linaro.org>
 <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
 <20190129102608.4k3wfli3dyomb7aa@debby>
Message-ID: <1e40561f-02d9-c356-8630-c301251048ff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/01/2019 11:26, Joakim Bech wrote:
> Hi Arnout,
> 
> On Mon, Jan 28, 2019 at 11:22:13PM +0100, Arnout Vandecappelle wrote:
>>  Hi Joakim,
>>
>>  Thanks for this updated patch, but you haven't taken into account the rest of
>> Thomas's comments.
>>
>>  I'll repeat them below for your convenience.
>>
> For some reason I totally missed those, thanks for the reminder!
> 
>>
>> On 28/01/2019 18:05, Joakim Bech wrote:
>> [snip]
>>> +config BR2_KERNEL_HEADERS_5_00
>>> +	bool "Linux 5.00.x kernel headers"
>>> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
>>
>>  Adding support for the 5.0 headers should be a separate patch. See commit
>> 649883d2c9957b7a7fcf81c4475f848ad8865ca1 for an example how it was done for 4.20.
>>
> So after looking a bit more into the git log of how patches where
> created in the past it looks like I should create 4 patches, "pseudo git
> log -4".
> - toolchain-external: update Arm ARM 8.2-2019.01
> - toolchain-external: update Arm AArch64-BE toolchain 8.2-2019.01
> - toolchain-external: update Arm AArch64 toolchain 8.2-2019.01
> - toolchain: add necessary options to support 5.0 kernel headers

 Indeed, that's the way to go.

[snip]
>>  The help text here also says which GDB, GCC, binutils and kernel headers
>> versions it is using. Please update that to the actual versions.
>>
> I cross checked with the versions mentioned in the release notes at
> (scroll down):
> https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads and
> it seems like all versions are the same as in the previous (2018.11)
> release, so no need for any update. However I found some inconsistency
> between arm-arm and arm-aarch64{-be}, the latter doesn't mention the
> tools/versions in the help text. Do you want me to add that similar to
> arm-arm?

 I guess the lack of details in the aarch64 toolchain is indeed just historical
accident. Thomas added this in 2012, I'm sure he still remembers why he didn't
add any details :-)

 It's not strictly necessary to add the details, but it would be great if you
do. You can do that either as a separate patch, or together with the version
bump, it's up to you.

[snip]
> Final question, I can see most patches on the mailing list prefixes with
> [Buildroot] [PATCH ...], i.e., I suppose that is something you want be
> to do also for future patches/patch sets?

 The [Buildroot] is added automatically by the list server, you can't add it by
hand. The way you submitted it was perfect. Well, maybe cross-posting to tee-dev
wasn't ideal because my replies don't end up on that list (I'm not subscribed) :-)

 Regards,
 Arnout

> 
> Thanks for the review, feedback and guidance.
> 
