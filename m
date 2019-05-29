From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 23:52:04 +0200
Subject: [Buildroot] [External] Re: Cannot cross-compile libopenssl on
 CentOS7
In-Reply-To: <CANQCQpZ5NMp5K1UR+o_OGB6anXZ+t_Erf52qo2QgBJo0Mxtu7Q@mail.gmail.com>
References: <3cd11507-8aa5-4fbe-c07a-54d4aacb8e74@ice.rwth-aachen.de>
 <fb7027e2-8897-2cee-65e0-4b8929779a6c@mind.be>
 <CANQCQpZ5NMp5K1UR+o_OGB6anXZ+t_Erf52qo2QgBJo0Mxtu7Q@mail.gmail.com>
Message-ID: <8a5da948-026b-bd8c-3870-be16402204b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 17:58, Matthew Weber wrote:
> All,
> 
> On Sat, May 25, 2019 at 10:54 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 21/05/2019 20:19, Lukas J?nger wrote:
>>> Hi,
>>>
>>> I tried building a rootfs with buildroot on CentOS 7 and I require libopenssl. I

 Lukas, you never mentioned which Buildroot version you're using.

>>> configured buildroot as seen in the attached .config.
>>  In the future, please post a defconfig instead of a full config. In this case:
>>
>> BR2_aarch64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
>> BR2_PACKAGE_XEN=y
>> BR2_PACKAGE_XEN_TOOLS=y
>>
>>
>>  Note that this is a configuration that gets tested by the autobuilders, and
>> unless I'm mistaken, Matt has a RHEL7 autobuilder (CentOS7 should be the same).
> Correct, I've got a RHEL7.4 builder running.  I've also just tested
> the above defconfig without any problems.

 And which version of Text::Template is installed on it?

 Oh, hang on, maybe you just don't have the module installed at all, and the
openssl build system works around it somehow?

 Regards,
 Arnout
