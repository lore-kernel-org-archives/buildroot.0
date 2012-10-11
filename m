From: =?UTF-8?B?R3LDqWdvcnkgSGVybWFudA==?= <gregory.hermant@calao-systems.com>
Date: Thu, 11 Oct 2012 09:02:07 +0200
Subject: [Buildroot] [PATCH v3] at91bootstrap: fix gcc-4.6.x overlap
 linker issue
In-Reply-To: <20121010131905.4c485886@skate>
References: <50753166.5010507@calao-systems.com>
 <20121010131905.4c485886@skate>
Message-ID: <50766EEF.7070308@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,
Thanks very much for your feedback.
gregory

Le 10/10/2012 13:19, Thomas Petazzoni a ?crit :
> Gr?gory,
> 
> On Wed, 10 Oct 2012 10:27:18 +0200, Gr?gory Hermant wrote:
>> Things always happen in threes...
>> This patch fixes an issue detected in the linking stage of the at91bootstraploader from gcc-4.6.x release.
>> Indeed from this gcc release the linking stage fails due to an overlap between text.startup and data section.
>> To fix this issue we need to modify the linker script in order to add the text.startup input section into the text output section.
>>
>>
>> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
>> ---
>>  ...at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch |   26 ++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
> 
> Unfortunately, it still cannot be applied as is:
> 
>  *) All the text before the --- separator goes into the commit log (so
>  it remains forever in the Buildroot commit history). Therefore, it
>  shouldn't contain "personal" comments such as "Things always happen in
>  threes"
> 
>  *) The commit log text should be wrapped at ~80 columns
> 
> In addition to that, most of the commit log text would benefit from
> being copy/pasted into the description of the
> at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch patch.
> 
> Of course, Peter can probably fix those minor problems while
> committing, but I thought it would be useful to describe what's still
> not perfect with your patch.
> 
> Best regards,
> 
> Thomas
> 
