From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Oct 2015 20:09:59 +0100
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <CAAEAJfD9aqax=VA3oXocGUC37GNt3AspfdNrWSroOMntBx1hqg@mail.gmail.com>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
 <5612C712.6020209@mind.be>
 <CAAEAJfD9aqax=VA3oXocGUC37GNt3AspfdNrWSroOMntBx1hqg@mail.gmail.com>
Message-ID: <5612CB07.5090201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-10-15 19:59, Ezequiel Garcia wrote:
> On 5 October 2015 at 15:53, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05-10-15 17:55, Ariel D'Alessandro wrote:
>>> The Advanced XIP File System is a Linux kernel filesystem driver that enables
>>> files to be executed directly from flash or ROM memory rather than being copied
>>> into RAM.
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
[snip]
>>> +config BR2_TARGET_ROOTFS_AXFS
>>> +     bool "axfs root filesystem"
>>> +     help
>>> +       Build an axfs root filesystem
>>
>>  This needs a lot more explanation. For starters, repeat the explanation you put
>> in the commit message (but wrap at 72 columns!). And perhaps you should add that
>> all files will be XIPified (or whatever the verb is). Also, you should mention
>> that the kernel has to be built with the axfs patches to be able to read it.
>>
>>  It would be nice to add the axfs kernel side as a kernel extension as well. But
>> that looks heavily non-trivial.
>>
> 
> Should we clarify that the FS is not supported in Linux mainline?

 That's what I mean with "the kernel has to be built with the axfs patches".


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
