From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 26 Apr 2012 09:52:31 +0200
Subject: [Buildroot] [PATCH 1/3] lttng-libust: bump to version 2.0.1
In-Reply-To: <874ns7ar7b.fsf@macbook.be.48ers.dk>
References: <1334517476-15258-1-git-send-email-s.martin49@gmail.com>
 <874ns7ar7b.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMM+98uc8qCuKvmsnt2sGiXheahRMbF0TRvn_DNH+O6aeeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,

2012/4/26 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
> ?Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Thanks. On what toolchain as this been tested?
I tested it using an "Armdeus-like" toolchain or a qemu_arm_versatile
+ WCHAR + gettext toolchain,
based on the head of master at the time of the submission.

>
> I gave it a try with our internal toolchain as the older version has
> been failing on the autobuilders, but I cannot build the new version
> either:
>
> ?CCLD ? test_urcu_dynamic_link
> test_urcu.o: In function `thr_writer':
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/test_urcu.c:282: undefined reference to `__sync_lock_test_and_set_4'
> urcu.o: In function `_uatomic_add_return':
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/../urcu/uatomic/generic.h:180: undefined reference to `__sync_add_and_fetch_4'
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/../urcu/uatomic/generic.h:180: undefined reference to `__sync_add_and_fetch_4'
> urcu.o: In function `_uatomic_or':
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/../urcu/uatomic/generic.h:145: undefined reference to `__sync_or_and_fetch_4'
> urcu.o: In function `call_rcu_data_free':
>

I don't remember having such troubles.

However, I was not able to build gettext without the patch from Maxime
Ripard (converting gettext to autotarget).
Whatever, this is another topic... on which I have some patches in the
queue I have to rework before posting them...


Regards,


Sam
