From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jul 2011 09:10:33 +0200
Subject: [Buildroot] /tmp puzzle
In-Reply-To: <CALo-6+j3AzdfCMxBmRVOCYWV8h8bZGZuNYRo6fuiyEkOtav-TA@mail.gmail.com>
 (Charles Krinke's message of "Mon, 11 Jul 2011 14:51:26 -0700")
References: <CALo-6+h28+HSpczw86fD=Jk0GJa3m+JR9hmHswTpvE59xvMKig@mail.gmail.com>
 <F9C551623D2CBB4C9488801D14F864C60401F1@ex-mb1.corp.adtran.com>
 <CALo-6+j3AzdfCMxBmRVOCYWV8h8bZGZuNYRo6fuiyEkOtav-TA@mail.gmail.com>
Message-ID: <8762n8j7o6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> Dear andy:
 Charles> Thank you. That confirms my experiments. I have gotten sem_open() to
 Charles> work and the key is that there *must* be a either a /dev/shm or a
 Charles> "tmpfs" accessible via /proc/mounts.

 Charles> I ended up disabling CONFIG_DEVTMPFS as after looking at all the
 Charles> mpc83x_defconfig's in the kernels from 2.6.32 through 2.6.39, they all
 Charles> have CONFIG_DEVTMPFS=n.

Which is probably purely historical. Devtmpfs is relatively new, but I'm
a very good match for the kind of systems we're targetting with
buildroot.

-- 
Bye, Peter Korsgaard
