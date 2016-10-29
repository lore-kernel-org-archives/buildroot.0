From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 29 Oct 2016 07:45:05 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-sHfxavEba9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #10 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Gustavo, Andrey,

OK, so this is a known issue with fakeroot relating to xattrs.
There is nothing we can do in Buildroot, except as you said,
to run outside fakeroot.

But that solution means we need to tweak our fs infra just
for the sake of a bug in fakeroot. That's not nice...

However, following the bug report Gustavo copied, I got to:
https://www.yoctoproject.org/tools-resources/projects/pseudo

As they say:

> Pseudo is a program that can either be used directly or as
> an LD_PRELOAD, which allows these operations to succeed as
> if the user did have system administrator privileges even
> though they are an ordinary user.
>
> Pseudo has a lot of similarities to fakeroot but is a new
> implementation that improves on the problems seen using
> fakeroot.

Maybe we should also go with pseudo in Buildroot, and ditch
fakeroot? I'll try to have a look at that, and see if I can
come up with a patch.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
