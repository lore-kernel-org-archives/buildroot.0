From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 25 Apr 2012 19:39:02 +0000 (UTC)
Subject: [Buildroot] [Bug 5138] New: Add dropbear config option to allow
 blank passwords
References: <bug-5138-163@https.bugs.busybox.net/>
 <20120425141823.GB20601@game.jcrosoft.org>
Message-ID: <jn9jsk$fob$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-25, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:
> On 13:38 Wed 25 Apr     , bugzilla at busybox.net wrote:
>> https://bugs.busybox.net/show_bug.cgi?id=5138
>> 
>>            Summary: Add dropbear config option to allow blank passwords
>>            Product: buildroot
>>            Version: unspecified
>>           Platform: All
>>         OS/Version: Linux
>>             Status: NEW
>>           Severity: enhancement
>>           Priority: P5
>>          Component: Other
>>         AssignedTo: unassigned at buildroot.uclibc.org
>>         ReportedBy: grant.b.edwards at gmail.com
>>                 CC: buildroot at uclibc.org
>>    Estimated Hours: 0.0
>> 
>> 
>> Created attachment 4292
>>   --> https://bugs.busybox.net/attachment.cgi?id=4292
>> Patch to add dropbear config option to allow blank passwords
>> 
>> Add a configuration option to allow enabling dropbear's ALLOW_BLANK_PASSWORD
>> feature.
>
> this is a security issue

Only if you set it (it defaults to "n") and the device in question is
on an accessible network.

> I prefer to add an option to add a default ssh public key

That doesn't do the same thing.

> I've a patch somewhere

I've no objection to having an option for a default key, but I don't
think it's buildroot's place to try to decide and enforce security
policies.  Those decisions belong to the person specifying and
designing the embedded system.

[Not allowing blank passwords in dropbear seems especially silly when
blank passwords are allowed by telnetd, login and openssh.]

-- 
Grant Edwards               grant.b.edwards        Yow! BARBARA STANWYCK makes
                                  at               me nervous!!
                              gmail.com            
