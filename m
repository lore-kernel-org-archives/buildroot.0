From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 14 Sep 2017 14:22:59 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: install all MIB files
In-Reply-To: <f14a15ee-4bc9-ffc0-38f1-fd15ebe43790@mind.be>
References: <20170908134548.23645-1-julien.floret@6wind.com>
 <8d8bb3d5-6ea9-94b4-1a53-a57909b8bbc6@mind.be>
 <CAHfJR7jjCn8FdGqhKOq=7_pAgwObLNSQUdzzdbzOi+ijyvJLCw@mail.gmail.com>
 <d60e9f05-f4d2-3927-ee7f-148d6db4c22c@mind.be>
 <CAHfJR7jTT1tGBQr-rgZ+JTZQW6rEhagyDJBQAfB0yUPJwh_evw@mail.gmail.com>
 <f14a15ee-4bc9-ffc0-38f1-fd15ebe43790@mind.be>
Message-ID: <CAHfJR7gj=RGjP7VHFzwET_5OD6u6XbdpvO1A5uDxaUjKtotdtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-09-13 23:24 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
[snip]
>  OK. Well, the only thing this patch does, in the end, is make the target
> filesystem a bit bigger. By how much, do you know?

Approximately 400K...

>  Users can always remove unneeded MIBs in a post-build script.
>
>
>> But without this patch, netsnmp is unusable for us, because we need
>> the object names and this hardcoded BLOAT_MIBS list removes mandatory
>> MIB files whatever the configuration options.
>
>  That's a good reason!
>
>> (By the way, some of the MIBS in BLOAT_MIBS (RFC-1215 and RFC1155-SMI)
>> don't seem to be suppressed, because the suffix added in
>> NETSNMP_REMOVE_BLOAT_MIBS ("-MIB.txt") doesn't apply for them...)
>
>  Yeah, the option is from the very first time the package was added 7 years ago,
> and hasn't been updated through all the version bumps...
>
>
>>>  Probably extending BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES should be a separate
>>> patch anyway.
>>
>> Yes, probably. I'm not sure these default values are the most common
>> case, however.
>
>  Never mind that, since it's anyway not really related, as you say.
>
>
>> Also, IMHO having two options {WITH,WITHOUT}_MIB_MODULES makes quite
>> difficult to know which modules are really enabled in the end.
>> I'm starting to think that maybe a better approach would be to have
>> one Config.in option per module... This would be clearer and would
>> perhaps also allow removing unused MIB files according to the modules
>> that are enabled or not.
>
>  But that would make for a really long list of options, no? I think that that's
> a bit too much.
>

That's right, that would make maybe 20 options... OK, it's probably
better to stick to the current options.

>
>>
>> So do you think this patch is acceptable for now?
>
>  I've applied, thanks.
>
>  Perhaps you could write up a CHANGES entry that explains that people should
> remove unneeded MIBs in a post-build script?

OK, I will see what I can do. Thanks!
