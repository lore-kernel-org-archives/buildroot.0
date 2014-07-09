From: Henry Margies <henry.margies@gmail.com>
Date: Wed, 9 Jul 2014 12:41:25 +0100
Subject: [Buildroot] [PATCH 1/1] Build Python with tzset support
In-Reply-To: <6B5AC78D-66CA-4C7D-AF6C-B2B9C181FA65@gmail.com>
References: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
 <20140708162840.5983803f@free-electrons.com>
 <6B5AC78D-66CA-4C7D-AF6C-B2B9C181FA65@gmail.com>
Message-ID: <44BA3A62-40E4-44CD-AD4F-00245A082EF5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I?ve sent a new version of my patch for Python 2.7 and 3, instead of a separate one just for Python3. Hope that?s easier.

> And I also agree that it would be nice to check the configure script, pity it is such a long one :) I?ll have a look tomorrow to see if I can spot anything obvious.


On the topic of AC_RUN_IFELSE, the configure script sets the following variables to these defaults when cross-compiling:

ac_cv_pthread_is_default=no
ac_cv_kpthread=no
ac_cv_kthread=no
ac_cv_pthread=no
ac_cv_pthread_system_supported=no
ac_cv_little_endian_double=no
ac_cv_big_endian_double=no
ac_cv_mixed_endian_double=no
ac_cv_x87_double_rounding=no
ac_cv_log1p_drops_zero_sign=no
ac_cv_posix_semaphores_enabled=yes
ac_cv_broken_sem_getvalue=yes
ac_cv_wchar_t_signed=yes
ac_cv_rshift_extends_sign=yes
ac_cv_broken_nice=no
ac_cv_broken_poll=no
ac_cv_working_tzset=no
ac_cv_have_long_long_format="cross -- assumming no? (set to yes by buildroot) 
ac_cv_have_size_t_format="cross -- assuming yes"
ac_cv_broken_mbstowcs=no
have_glibc_memmove_bug=undefined
have_ipa_pure_const_bug=undefined
ac_cv_buggy_getaddrinfo=yes unless configured with --(en|dis)able-ipv6

I suppose the pthread detection may not matter so much as the appropriate flags are probably set in environment variables?

Anyway, I thought I post it here so people can see and comment. 


Best regards,
Henry
