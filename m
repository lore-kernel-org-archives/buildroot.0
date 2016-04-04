From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Apr 2016 22:40:16 +0200
Subject: [Buildroot] [PATCH] linux: use zImage by default on ARM
In-Reply-To: <CAJJ6jxu=KscT+V-fAiqo16E673tnk7Zo2j+=OaVqicQYQ4YVUg@mail.gmail.com>
References: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAJJ6jxu=KscT+V-fAiqo16E673tnk7Zo2j+=OaVqicQYQ4YVUg@mail.gmail.com>
Message-ID: <5702D130.5090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/16 19:57, Steve Calfee wrote:
> On Thu, Mar 31, 2016 at 12:34 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Since quite some time, the kernel and bootloader communities consider
>> zImage as the default format for kernel images on ARM, replacing
>> uImage. The load address information in uImage is no longer needed,
>> since the kernel is position-independent in terms of physical address,
>> except on a few old platforms. For most people, using zImage is simply
>> better/simpler, so let's switch to zImage as the default image format
>> on ARM.
>>
>> All defconfigs are updated: 46 defconfigs no longer need to select
>> explicitly zImage because it's the default, and 16 defconfigs now need
>> to explicitly select uImage because that's no longer the default.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>
> Is this a good idea? Doesn't this break external configs that use
> uImage? Changing a default is a serious change.

  A defconfig is not very reliable when updating buildroot, because defaults may 
change. When updating buildroot, you should use a full config. This also tells 
you which options are new for example.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
