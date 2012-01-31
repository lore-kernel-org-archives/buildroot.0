From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 31 Jan 2012 10:23:49 +0100
Subject: [Buildroot] [PATCH] New package: libical
In-Reply-To: <201201302343.26186.arnout@mind.be>
References: <1327676345-8958-1-git-send-email-yegorslists@googlemail.com>
 <201201302343.26186.arnout@mind.be>
Message-ID: <CAGm1_ktjH8rhsC6r9fguaMqzcgDPtAm6-EOpQBqXHF_mwj3qRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 30, 2012 at 11:43 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Friday 27 January 2012 15:59:05 yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks for review.

> [snip]
>> diff --git a/package/libical/Config.in b/package/libical/Config.in
>> new file mode 100644
>> index 0000000..12abdb2
>> --- /dev/null
>> +++ b/package/libical/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_LIBICAL
>> + ? ? bool "libical"
>> + ? ? depends on BR2_USE_WCHAR
>> + ? ? help
>> + ? ? ? libical is an Open Source (MPL/LGPL) implementation of the IETF's
>> + ? ? ? iCalendar Calendaring and Scheduling protocols.
>> +
>> + ? ? ? http://www.citadel.org/doku.php/documentation:featured_projects:libical
>> +
>> +comment "libical requires a toolchain with WCHAR support"
>> + ? ? depends on !(BR2_USE_WCHAR)
> ?I think the brackets are redundant here.

This is how Peter made this for blue-utils, so I just copied this.

>> diff --git a/package/libical/libical.mk b/package/libical/libical.mk
>> new file mode 100644
>> index 0000000..63311eb
>> --- /dev/null
>> +++ b/package/libical/libical.mk
>> @@ -0,0 +1,12 @@
>> +#############################################################
>> +#
>> +# libical
>> +#
>> +#############################################################
>> +
>> +LIBICAL_VERSION = 0.48
>> +LIBICAL_SITE = http://heanet.dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
> ?Please use $(BR2_SOURCEFORGE_MIRROR)

Will do.

Yegor
