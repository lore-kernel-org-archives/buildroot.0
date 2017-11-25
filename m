From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Nov 2017 18:40:03 +0100
Subject: [Buildroot] [PATCH v1] busybox: Fix rtcwake to use /dev/rtc0
 properly
In-Reply-To: <1511530053.25007.435.camel@linux.intel.com>
References: <20171123183914.71769-1-andriy.shevchenko@linux.intel.com>
 <b2f0d3bf-b8a1-c948-2013-35dc605c2cbd@mind.be>
 <1511530053.25007.435.camel@linux.intel.com>
Message-ID: <f5531efb-4352-d8af-5c2a-5ba38bab94c4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andy,

 Sorry, I should have started my mail with:

 Thank you very much for your contributation. I'm afraid, however, we will not
accept it as is in Buildroot.


On 24-11-17 14:27, Andy Shevchenko wrote:
> On Thu, 2017-11-23 at 23:46 +0100, Arnout Vandecappelle wrote:
>>  Hi Andy,
>>
>> On 23-11-17 19:39, Andy Shevchenko wrote:
>>> rtcwake from busybox has failed in case the /dev/rtc is a symlink
>>> (which is default case for udev enabled systems) due to wrong
>>> pathname
>>> used for a sysfs wakeup attribute.
>>
>>  In Buildroot, we don't accept "feature patches" for packages.
> 
> To be honest it's not a feature patch at all. It fixes (okay,
> workarounds) obvious bug in rtcwake logic. Easy to reproduce. 100%
> reproducible

 Yes, that's why I continued with:

>>  We try to limit
>> to patches that fix the build or complete breakage, sometimes also to
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 For other bugs, we will happily include upstream patches. But patches that are
not yet upstream are dangerous: how can we be sure that it doesn't break things?
In this particular case, you patch *will* actually break things for a who does
have a working /dev/rtc but it is something different than /dev/rtc0. We want
upstream to take the responsibility for that.

>> make it
>> work together with other packages. I think this patch doesn't fall in
>> that category.
> 
> Whatever, your choice at the end.
> 
>>
>>  For sure, you should first send the patch upstream.
> 
> Are you sure I didn't?

 I checked the mailing list, it wasn't there. I checked google, and found nothing.

> The policy of Busybox mailing list is to reject (I'm not subscriber and

 Buildroot mailing list has the same policy (well, it goes into a moderation
queue but that is filled up with so much spam that it's unlikely it ever makes
it to the list). If you have a solution to bar spam from mailing lists, please
share it!

> after a such policy would not like to be one). Happy contribution!
> 
>>  Particularly in the case of
>> busybox, Denys often proposes improved patches. If it gets accepted
>> upstream,
>> then we can consider including it in Buildroot as well.
> 
> Good luck!
> 
> I'm done with it. If Denys is caring about project he will take the
> series (there are more patches than just one) from his private mailbox
> (Cc was there as well).

 If/when he does, feel free to resubmit with a reference to the upstream commit.

 Thanks!

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
