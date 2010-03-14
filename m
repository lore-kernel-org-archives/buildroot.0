From: Will Wagner <will_wagner@carallon.com>
Date: Sun, 14 Mar 2010 22:26:43 +0000
Subject: [Buildroot] Pull request for branch x11r75patches
In-Reply-To: <4B9D064A.6020106@gmail.com>
References: <4B96D09D.4070100@carallon.com> <4B9BE875.9040500@gmail.com>
	<4B9C0F88.7000209@carallon.com> <4B9D064A.6020106@gmail.com>
Message-ID: <4B9D62A3.7090605@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/03/2010 15:52, Paulius Zaleckas wrote:
> On 03/14/2010 12:19 AM, Will Wagner wrote:
>>
>>>> xproto_xf86miscproto: bump version
>>>> xlib_libpciaccess: bump version
>>>
>>> libpciaccess fails... due to libtool patch:
>>>
>>> >>> Patching libtool
>>>
>>> Applying buildroot-libtool.patch using plaintext:
>>> patching file ltmain.sh
>>> Hunk #1 FAILED at 273.
>>> Hunk #2 succeeded at 5412 (offset 3005 lines).
>>> Hunk #3 FAILED at 2551.
>>> Hunk #4 FAILED at 2895.
>>> Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
>>> Hunk #6 FAILED at 5937.
>>> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
>>> Patch failed! Please fix buildroot-libtool.patch!
>>> make: ***
>>> [/home/paulius/buildroot/output/build/xlib_libpciaccess-0.11.0/.stamp_patched] 
>>>
>>> Error 1
>>>
>> Odd, I definitely have it building, will try to work out why it works
>> for me.
>>
>> It's easy to fix by disabling the libtool step. Would be good to fixup
>> the libtool patching though so it spots what version the package has and
>> patches accordingly.
>
> XLIB_LIBPCIACCESS_LIBTOOL_PATCH = NO
>
> solved this problem for me, but later I got another error and I don't 
> know
> yet how to fix it...

What target graphics hardware are you building for? I'll take a look in 
the morning and see if I can work out what's going on.

Will
