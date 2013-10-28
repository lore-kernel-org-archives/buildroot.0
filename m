From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Mon, 28 Oct 2013 18:34:53 +0100
Subject: [Buildroot] Problems with Python ctypes on Raspberry Pi
 platfform - Was: Re: [PATCH v2 1/1] python-pyusb: new package
In-Reply-To: <CAMduVEcp4u0Xb5tSK=LV_s5E2jGF501R_eKjWFnOUWtcTZ4URw@mail.gmail.com>
References: <CAMduVEcp4u0Xb5tSK=LV_s5E2jGF501R_eKjWFnOUWtcTZ4URw@mail.gmail.com>
Message-ID: <CAMduVEfWmePNxsx-VhkrAp+BsjXA80SVKE0fayU7fRosvoumWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have reported that problem also on comp.arch.embedded, and I was
informed, that I have made a mistake in my workaround:
>             mach_map = {
>                 'x86_64-64': 'libc6,x86-64',
>                 'ppc64-64': 'libc6,64bit',
>                 'sparc64-64': 'libc6,64bit',
>                 's390x-64': 'libc6,64bit',
>                 'ia64-64': 'libc6,IA-64',
>                 }

There should be:
                 'armv6l':'libc0', # Added by WZab for ctypes support
on Raspberry Pi
(with colon, not with comma).

-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
8192R/4569D119 - for standard messages
16384R/1312D8F8 - for confidential messages
