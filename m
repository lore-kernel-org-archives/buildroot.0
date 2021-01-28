From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 28 Jan 2021 05:46:18 +0000
Subject: [Buildroot] Issue with using PPL package for gcc 4.4.4
In-Reply-To: <mailman.17.1611748803.230602.buildroot@busybox.net>
References: <mailman.17.1611748803.230602.buildroot@busybox.net>
Message-ID: <98e3bb366f2121726803be6b0ec046c8@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ramesh,

> Date: Wed, 27 Jan 2021 03:46:46 +0000
> Subject: [Buildroot] Issue with using PPL package for gcc 4.4.4
> Message-ID:
> 	<MN2PR07MB69429BBBD323EA4CC815FBD7EDBB9@MN2PR07MB6942.namprd07.prod.outlook.com>

> checking how to link with libgmp... \
> /home/mht/disk/mht/obuilds/template-4.4.4-2.6/host/lib/libgmp.so 
> -Wl,-rpath \
> -Wl,/home/mht/disk/mht/obuilds/template-4.4.4-2.6/host/lib checking how 
> to link with \
> libgmpxx... -lgmpxx 
> /home/mht/disk/mht/obuilds/template-4.4.4-2.6/host/lib/libgmp.so \
> -Wl,-rpath -Wl,/home/mht/disk/mht/obuilds/template-4.4.4-2.6/host/lib 
> checking for \
>                the GMP library version 4.1.3 or above... no

Looking at your build log I would guess you are missing C++ support 
(BR2_TOOLCHAIN_BUILDROOT_CXX) in your toolchain.

Kind regards,
Andreas
