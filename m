From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 27 Jul 2012 01:23:39 +0200
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <5011CED2.4060105@zacarias.com.ar>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
 <5011CED2.4060105@zacarias.com.ar>
Message-ID: <CAHXCMMJgpShM7M09zC4zdubMESd-RTdwiee3-Jn754MDasSccg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/27 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 07/26/12 19:30, Samuel Martin wrote:
>
>> Though I understand why you prefer this one, I somehow don't really
>> like it... because it's not about build dependency, but build/install
>> order...
>>
>> At least it would be worth to document which binary works if using the
>> one provided by the busybox built instead of the one provided by
>> another package, which doesn't.
>> This makes echo to some other recent thread about using login from
>> util-linux or busybox.
>>
>>
>> Regards,
>
> It's pretty much standard issue in buildroot for busybox command
> alternatives that are richer in functionality when they're selected.
> If less is in the configuration it's because someone wants it, specially
> since it's hidden by the BUSYBOX_SHOW_OTHERS kludge to avoid
> big/duplicate alternatives.
> Just hit this particular one when testing the ncurses bump, got busybox
> less which doesn't use it even though i selected standalone less.
> Maybe i don't understand what you mean about build dependency, but it's
> the only way at the moment to ensure it's built after busybox in a
> simple way.
> And it's been done for a ton of other packages already like iproute2,
> gawk, grep, sysklogd, usbutils and so on...
Fair enough.

> Granted that util-linux might have a heavier hand since the options
> aren't so granular and there are several binaries with differing
> functionality that overlap busybox, but it's a completely different case
> than this.
> Regards.
>


-- 
Sam
