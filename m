From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jul 2019 23:18:35 +0200
Subject: [Buildroot] Qt5 LTS handling [was: package/qt5: bump latest
 version to 5.12.4]
In-Reply-To: <20190712211529.00fbf6e0@gmx.net>
References: <20190710173645.15459-1-ps.report@gmx.net>
 <20190710173645.15459-2-ps.report@gmx.net>
 <891f19e9-a64b-c025-b5cd-f7a0517fbc35@mind.be>
 <20190711210233.0b7eb0aa@gmx.net>
 <93af8798-0395-2c9f-dd0f-aad677dc0909@mind.be>
 <20190712211529.00fbf6e0@gmx.net>
Message-ID: <8f646260-7e2b-8d47-82c0-2624e86cfb56@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/07/2019 21:15, Peter Seiderer wrote:
> Hello Arnout,
> 
> On Fri, 12 Jul 2019 11:40:43 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>  At the last BR meeting it was decided to drop LTS entirely, because it is
>> causing too much pain. Instead, we'd aim for an LTS version to be included in
>> the 20xx.02 Buildroot release, and bump to a non-LTS release shortly after that.
> 
> For the record the link to the meeting notes, see [1]...

 Thanks, forgot to include that.


>>  I'm not sure, however, if this is possible. It would mean that we would delay
>> the bump to 5.13 until after 2020.02. So in practice, we'd skip 5.13 and jump to
>> 5.14. It works out now, but since Qt releases an LTS every year-and-a-half,
>> approximately, it will probably get us into trouble at some point...
> 
> Delaying a possible bump to 5.13 would be a pity, trying to get qt for buildroot
> up-to-date for an customer (to keep up with the windows folks who are
> happily bumping versions ;-) )...
> 
> Plus the option to maintain a back-portable Latest-LTS leeds to an
> LTS-5.12 and Latest 5.13/5.14/6.0... solution...

 So, how do you feel about the maintenance overhead of having two parallel versions?


>>
>>  Anyway, there is talk of Qt6, which will change the landscape again...
>>
>>
>>  So actually, my proposal would be to forego the LTS entirely and just go for
>> latest. That does mean that we end up with an unmaintained qt5 in our own LTS
>> branch. For example, Qt 5.14 will probably get its last update around June 2020.
>> Note that the current situation (LTS vs. Latest choice) would not be a solution
>> for that - the Latest would still be in the unmaintained situation, so it would
>> in practice not be useable.

 Addendum to my earlier statement: in my (admittedly limited) experience, there
isn't really much reason to stick to LTS releases. Backward compatibility is
generally OK, and regressions can be fixed.

 Regards,
 Arnout


> 
> Regards,
> Peter
> 
> [1]  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Qt5_versions_to_support:_keep_5.6_or_a_newer_LTS.3F
> 
>>
>>
>>  Regards,
>>  Arnout
>>
> 
