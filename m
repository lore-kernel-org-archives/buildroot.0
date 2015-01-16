From: bjoern at am-soft.de <bjoern@am-soft.de>
Date: Fri, 16 Jan 2015 06:49:44 +0100 (CET)
Subject: [Buildroot] Fwd: Qt4 Application - Touch detection
In-Reply-To: <CADKZYYJArGCAPBOkzTcKvc-BgiUieZpx0Qjw-0zDycwJVPAX5A@mail.gmail.com>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
 <20150115200634.598a27a3@tux.kirchner>
 <CADKZYYL-uKCvyEU9w7eAWi-yZv4bky5dTEz+RpUNAJQchjw2-Q@mail.gmail.com>
 <20150115212231.08000b68@tux.kirchner>
 <CADKZYYJArGCAPBOkzTcKvc-BgiUieZpx0Qjw-0zDycwJVPAX5A@mail.gmail.com>
Message-ID: <6779ce2913b65ea70633d09a38e1cbdf.squirrel@3p.am-soft.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
>> So, you did something like this?
>> # export TSLIB_TSDEVICE=/dev/input/event0
>> # export QWS_MOUSE_PROTO="tslib:/dev/input/event0"
>> # <qtExample>
>> And there the touch screen worked correctly? And your program didn't?
>
>
> Yes that is correct. However, I still don't understand why export doesn't
> work within a script. I understood your explanation; the TI file system
> uses profile.d to export these variables again in bash. I will try doing
> that with profile file in etc to make it part of the startup routine.
>

Imagine the processes on a linux system as a tree. For example:

/sbin/init
|
|
A
|
+--> B
|    |
|    |
|    C
|
D

If you export a variable in process B this variable will be also available
in process C. But B cannot change the environment of process A. Therefore
this environment variable exported by B will not be available in process D.

Does profile.d change non-login environments? If your program starts via
a service at boot time I'm not sure if it gets an environment set up by
the files in profile.d.

I used the pragmatic approach and used start scripts for my programs that
need specific environment variables set.

> I'm going to try and compile my application with the Qt built by buildroot
> and I will reply back with my findings.
>
> Thanks once again for your patience and help.
> Regards
>
> Santhosh
>
