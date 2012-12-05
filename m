From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Dec 2012 17:03:52 +0000
Subject: [Buildroot] [PATCH] libevent: Add Gentoo patch for C libraries
 without the sysctl syscall
In-Reply-To: <87obi8a1cl.fsf@dell.be.48ers.dk>
References: <1353495389-20179-1-git-send-email-markos.chandras@gmail.com>
 <CAG2jQ8ga3RoFPshV5x7Fad4rVCnp_aiq9My_HpqPqU1w1Ri-Cg@mail.gmail.com>
 <87obi8a1cl.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8gqDLUL3-qnc_-+kekfd_M12R8V6Qx9wkbmirwDoxzwwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 December 2012 16:51, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
> Hi,
>
>  >> +++ b/package/libevent/libevent-sysctl.patch
>  >> @@ -0,0 +1,46 @@
>  >> +Add Gentoo fix for C libraries that lack the sysctl system call
>  >> +http://sources2.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libevent/files/libevent-2.0.16-sysctl.patch?revision=1.1
>  >> +This patch has already been commited upstream
>  >> +
>  >> +Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>  >> +
>  >> +From 358c745e5432f7648b6f8b3188f32b5551cbf9d6 Mon Sep 17 00:00:00 2001
>  >> +From: Mike Frysinger <vapier@gentoo.org>
>  >> +Date: Thu, 8 Dec 2011 11:39:48 -0500
>  >> +Subject: [PATCH] check for sysctl before we use it
>  >> +
>  >> +Not all C libraries under Linux support the sysctl() func.
>
>  Markos> Ping? :-)
>
> What archs (in Buildroot context) are affected by this?
>
> --
> Bye, Peter Korsgaard

Hi Peter,

All of the existing architectures in buildroot support the sysctl
syscall. However, this patch will not cause any problem
for these architectures anyway.

-- 
Regards,
Markos
