From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 6 Jan 2017 00:25:28 +0100
Subject: [Buildroot] [PATCH 2/2] efl: do not force dependency on libudev
 by making eeze a config option.
In-Reply-To: <CAPdpN3BepwRMCy-5QdY1zFCkYzN4OTUuW07AzAO7M1U63oE3BA@mail.gmail.com>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-3-barbieri@profusion.mobi>
 <1bbc8ae0-66c1-5e55-4d1a-64dfba384d40@gmail.com>
 <CAPdpN3BepwRMCy-5QdY1zFCkYzN4OTUuW07AzAO7M1U63oE3BA@mail.gmail.com>
Message-ID: <a717df73-14a3-4751-a5a9-4a16587e977e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/01/2017 ? 02:10, Gustavo Sverzut Barbieri a ?crit :
> On Tue, Jan 3, 2017 at 8:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Gustavo,
>>
>> Thanks for these patches!
>>
>> Le 03/01/2017 ? 22:29, Gustavo Sverzut Barbieri a ?crit :
>>> Although highly recommended to be enabled, EFL's eeze can be disabled
>>> and thus no dependency on libudev or dynamic device management.
>>
>> When I stated to rework and bump the efl packaging in Buildroot, the eeze
>> dependency was mandatory. So I added an option to disable it only for the
>> host-efl package. See [1]. As I said on IRC, I didn't event tested efl without
>> eeze on the target and I don't think that the EFL developers even tested it.
>>
>> But since you are involved in efl development, I expect
>> --you-really-know-what-you-re-doing-and-that-this-will-probably-break-things-and-you-will-fix-them-yourself-and-send-patches-abb
>> :)
>>
>> [1]
>> https://git.enlightenment.org/core/efl.git/commit/?id=4351f0fa8642b163799c6ce47610d5cd9f70acfa
> 
> yes, I saw that and it's a nice addition. Eeze used to be optional,
> but when we moved to the single efl tree I was one of the developers
> unifying the autohell stuff and to make it simpler I reduced some
> options until someone find a need for that... so you found it... and
> I'm using it :-D

:)

> 
> I'm testing that inside qemu using a build derived from
> qemu_arm_versatile_defconfig with glibc, efl and few other utilities
> to test webkitefl. So far it's working, but if something break I'll
> patch efl to fix that.

OK great!

Best regards,
Romain

> 
> 
> 
>>>  config BR2_PACKAGE_EFL_DRM
>>>       bool "Evas DRM Engine"
>>> +     depends on BR2_PACKAGE_EFL_EEZE
>>
>> Add a new comment like for BR2_PACKAGE_EFL_EEZE
> 
> will do.
> 
> 
