From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 15:23:56 +0200
Subject: [Buildroot] [PATCH v5 2/2] systemd: select util-linux/fsck and
 e2fsprogs/e2fsck
In-Reply-To: <CAGduivwfXJ48p+wLgGSO=aMZ9mZHFBP6d_o3-pyPwiuup_n-ug@mail.gmail.com>
References: <1491794596-8454-1-git-send-email-casantos@datacom.ind.br>
 <1491794596-8454-3-git-send-email-casantos@datacom.ind.br>
 <CAGduivxv5seLe6Oz7j+DBjA3kX=b5ksKfTPbStTYezhrKqo7Yg@mail.gmail.com>
 <f30c9756-7b98-ec8c-90dd-612d31d81491@mind.be>
 <CAGduivzjdtVRrKJbfD3TZpoNDX=rEUP_d42dErCid-eg1UQySw@mail.gmail.com>
 <3d2149da-e02b-974c-bc4c-904db7bf02ef@mind.be>
 <2133795248.18260521.1491826188846.JavaMail.zimbra@datacom.ind.br>
 <CAGduivwfXJ48p+wLgGSO=aMZ9mZHFBP6d_o3-pyPwiuup_n-ug@mail.gmail.com>
Message-ID: <0e2cc250-ed8d-aca4-0d0a-141f5455deee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 14:22, Maxime Hadjinlian wrote:
> On Mon, Apr 10, 2017 at 2:09 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
>>> From: "Arnout Vandecappelle" <arnout@mind.be>
>>> To: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>>> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "buildroot" <buildroot@buildroot.org>, "Thomas Petazzoni"
>>> <thomas.petazzoni@free-electrons.com>, "Joergen Pihlflyckt" <Jorgen.Pihlflyckt@ajeco.fi>
>>> Sent: Monday, April 10, 2017 8:44:45 AM
>>> Subject: Re: [PATCH v5 2/2] systemd: select util-linux/fsck and e2fsprogs/e2fsck
>>
>>> On 10-04-17 13:30, Maxime Hadjinlian wrote:
>>>> Hi Arnout,
>>>>
>>>> On Mon, Apr 10, 2017 at 1:13 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>>  Hi Maxime,
>>>>>
>>>>> On 10-04-17 13:02, Maxime Hadjinlian wrote:
>>>>>> Hi all, Carlos
>>>>>>
>> ---8<---
>>>>>> I haven't tested it but this looks good to me.
>>>>>>
>>>>>> Reviewed-by: "Maxime Hadjinlian <maxime.hadjinlian@gmail.com>"
>>>>>
>>>>>  Do you agree with me that selecting e2fsprogs shouldn't be necessary, because
>>>>> you actually only need them when you mount an ext2 filesystem (which isn't
>>>>> necessarily the case)?
>>>>>
>>>>>  I'm not sure what happens exactly when you have util-linux fsck but no e2fsck
>>>>> and you try to mount an ext2 filesystem...
>>>> It would error out I think.
>>>
>>> So, what does it do when you have a ubifs for which no fsck exists?
>>>
>>> Since I guess you and/or Carlos have a systemd-based Buildroot-built system
>>> available, you could perhaps add a squashfs to your /etc/fstab and see what
>>> happens? Or remove e2fsck and see what happens?
> If you remove e2fsck (which is how I found out about this issue), the
> fsck at .service will fail and an error message will be displayed in the
> boot process. That's all that's going to happen. But then, your FS is
> never checked which can be more problematic.
> I assume the same thing happens with other filesystems because fsck.FS
> won't exist.
> 
> This won't forbid you to boot, just display an error message.

 OK, then I think that's exactly what we want. It still boots, but it's clear to
the user what is going wrong because an error message is displayed.

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
