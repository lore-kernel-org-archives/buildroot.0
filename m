From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Apr 2012 09:59:19 +0200
Subject: [Buildroot] [PATCH 1/3] lttng-libust: bump to version 2.0.1
In-Reply-To: <874ns7ar7b.fsf@macbook.be.48ers.dk>
References: <1334517476-15258-1-git-send-email-s.martin49@gmail.com>
 <874ns7ar7b.fsf@macbook.be.48ers.dk>
Message-ID: <20120426095919.0f163bac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Apr 2012 09:27:04 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> Thanks. On what toolchain as this been tested?
> 
> I gave it a try with our internal toolchain as the older version has
> been failing on the autobuilders, but I cannot build the new version
> either:
> 
>   CCLD   test_urcu_dynamic_link
> test_urcu.o: In function `thr_writer':
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/test_urcu.c:282: undefined reference to `__sync_lock_test_and_set_4'
> urcu.o: In function `_uatomic_add_return':
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/../urcu/uatomic/generic.h:180: undefined reference to `__sync_add_and_fetch_4'
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/../urcu/uatomic/generic.h:180: undefined reference to `__sync_add_and_fetch_4'
> urcu.o: In function `_uatomic_or':
> /home/peko/source/buildroot/output/build/liburcu-0.6.7/tests/../urcu/uatomic/generic.h:145: undefined reference to `__sync_or_and_fetch_4'
> urcu.o: In function `call_rcu_data_free':

You need gcc >= 4.4 to build lttng components. I guess you're using gcc
4.3 here, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
