From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Mar 2016 22:19:32 +0100
Subject: [Buildroot] The best way to add a new group to /etc/group
In-Reply-To: <20160318174359.GC3696@free.fr>
References: <CALtfCQY_vSZ3PGxgqhAsEsVpir+5p76TfLhCdQYJZASsNnSDzA@mail.gmail.com>
 <20160318174359.GC3696@free.fr>
Message-ID: <56EC70E4.9060007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 18:43, Yann E. MORIN wrote:
> ?scar, All,
>
> On 2016-03-18 10:38 +0100, ?scar G?mez Fuente spake thusly:
>> I'm building a new package in buildroot and I would like to know the best
>> way to add a new group.
>>
>> I have to add a new group called: test_group. In my system (with
>> INIT_SYSV). I have a user called root and I have to add it to this group
>> too.
>>
>> I've read the section "17.5.2. generic-package reference" in the buidroot
>> manual and find this variable: NAMEPACKAGE_USERS that it's very interesting
>> because automatically it adds the user you want and the uid and guid can be
>> computed automatically, so is very useful.
>>
>> Does anyone know if there is something similar to add a group?
>
> Yes, it's simple: specify the username as just a plain dash '-', as
> explained in the manual:
>      https://buildroot.org/downloads/manual/manual.html#makeuser-syntax
>
>      ---8<---
>      username is the desired user name (aka login name) for the user. It
>      can not be root, and must be unique. If set to -, then just a group
>      will be created.

  But as far as I know, there is no way to add users to a group, no? So to add 
the root user to this new group, the only option is to explicitly update the 
groups file.

  Regards,
  Arnout

>      ---8<---
>
> Regards,
> Yann E. MORIN.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
