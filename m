From: Will Wagner <will_wagner@carallon.com>
Date: Sat, 13 Mar 2010 22:19:52 +0000
Subject: [Buildroot] Pull request for branch x11r75patches
In-Reply-To: <4B9BE875.9040500@gmail.com>
References: <4B96D09D.4070100@carallon.com> <4B9BE875.9040500@gmail.com>
Message-ID: <4B9C0F88.7000209@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> xproto_xf86miscproto: bump version
>> xlib_libpciaccess: bump version
>
> libpciaccess fails... due to libtool patch:
>
> >>>   Patching libtool
>
> Applying buildroot-libtool.patch using plaintext:
> patching file ltmain.sh
> Hunk #1 FAILED at 273.
> Hunk #2 succeeded at 5412 (offset 3005 lines).
> Hunk #3 FAILED at 2551.
> Hunk #4 FAILED at 2895.
> Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
> Hunk #6 FAILED at 5937.
> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> Patch failed!  Please fix buildroot-libtool.patch!
> make: *** 
> [/home/paulius/buildroot/output/build/xlib_libpciaccess-0.11.0/.stamp_patched] 
> Error 1
>
Odd, I definitely have it building, will try to work out why it works 
for me.

It's easy to fix by disabling the libtool step. Would be good to fixup 
the libtool patching though so it spots what version the package has and 
patches accordingly.

Anyone an expert on the libtool patch. Is the patch not needed for 2.2.6 
of ltmain.sh? If so I guess we can check the version before patching.

Will
