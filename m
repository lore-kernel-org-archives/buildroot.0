From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 4 May 2018 11:20:37 +0200
Subject: [Buildroot] [PATCH v2] package/mender: new package
In-Reply-To: <20180504111604.37f6f0e5@windsurf>
References: <1525384358-26211-1-git-send-email-angelo@amarulasolutions.com>
 <20180504092346.6b5835db@windsurf>
 <CA+_SqVYNqhb6pAc6wzaf4v79D+Jn9YruJjWhaNJL9NJ-jmc05A@mail.gmail.com>
 <20180504111604.37f6f0e5@windsurf>
Message-ID: <CA+_SqVa3gEtET7KoCGz6-EG=AaYFtnQKeKgHxA6iRyP0uM3z-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Fri, May 4, 2018 at 11:16 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri, 4 May 2018 11:09:52 +0200, Angelo Compagnucci wrote:
>
>> > Not a complete review by far, but I'm wondering if it makes sense to
>> > include server certificates in Buildroot. I would assume that one would
>> > want to generate his own certificate instead, no ?
>>
>> It's a test certificate just to starting up. The same file is included
>> in the official yocto package so I thought it could useful to have
>> here.
>
> Ah, OK. Then perhaps it is fine to have this test certificate as well.
>
>> > Is there anything that makes mender tied to systemd, other than the
>> > fact that you provide only a systemd mender.service, and no init
>> > script ?
>>
>> Mender depends on systemd stating to the requirements here
>> https://docs.mender.io/1.4/devices/system-requirements
>
> I'm wondering whether this is a real dependency (i.e they are linked
> with systemd libraries), or whether it is just that they have only
> tested their integration with systemd.
>
> But OK, if they advertise this as a dependency, it's reasonable to have
> that as well in Buildroot. It can be relaxed later on if someone is
> interested in using Mender in a non-systemd system.

Systemd is used to automate the workflow of
download/install/reboot/verify operations of the mender daemon.
This part can be disabled at compile time if a user is planning to use
mender manually and don't want to relay on the mender daemon.
I think this is fairly a not so common use case to justify the package changes.

BTW, I will look into this if there is the requirement.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
