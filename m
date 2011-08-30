From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Aug 2011 23:37:08 +0200
Subject: [Buildroot] Linux kernel hangs after boot without any error!
In-Reply-To: <DEB91A26-9E37-4C94-99DF-72B324C6A23B@gmx.net> (Heiko Helmle's
 message of "Tue, 30 Aug 2011 21:45:21 +0200")
References: <CADfuMF78u9we4HXSKZfnWYu4xwMX3vrKoVtbx+-c1L563KDOvw@mail.gmail.com>
 <201108300545.59774.minimod@morethan.org>
 <DEB91A26-9E37-4C94-99DF-72B324C6A23B@gmx.net>
Message-ID: <878vqaoa2j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:

Hi,

 Heiko> Just a thought - would it hurt much to start a getty on tty1 by
 Heiko> default? at least on x86?

We used to do that, but it has the disadvantage that the console gets
spewed with lots of errors about getty failing when you don't have a
tty1 (E.G. for the fairly common case of no framebuffer console support
in the kernel).

We currently don't do anything architecture specific for the rootfs
skeleton, and I would prefer to keep it like that for simplicity
reasons.

-- 
Bye, Peter Korsgaard
