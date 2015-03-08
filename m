From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 8 Mar 2015 14:34:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-06
In-Reply-To: <20150308083311.0bbb4d22@free-electrons.com>
References: <20150307073020.C6D511011A8@stock.ovh.net>
 <CAGm1_kt_5oR3X4f7O5cbx8z5BS5Jeu_W2hQg+9oucnVgV+BWmw@mail.gmail.com>
 <20150308083311.0bbb4d22@free-electrons.com>
Message-ID: <CAGm1_ktz5WaMJHnvhPbeaA8CrS7WeR5gtMcmsTYSqmwv5N7aVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2015 at 8:33 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Sat, 7 Mar 2015 22:50:03 +0100, Yegor Yefremov wrote:
>
>> >      powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/8f52839127c2c9a6cda6fb9bd7a44ad4d1d19fd0/
>> >      powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/8f06dc86c698eff1e49c3c74b028b90c7eac51e1/
>>
>> How old is powerpc toolchain? This symbol N_SLCAN is in
>> include/uapi/linux/tty.h since 2012 and perhaps even earlier before
>> uapi was introduced.
>
> This powerpc toolchain is quite old, and is kept in the autobuilders
> precisely for this reason. This define has been added in kernel commit
> cd05acfe65ed2cf2db683fa9a6adb8d35635263b, in December 2007. It was part
> of the 2.6.25 kernel release.
>
> This toolchain uses the 2.6.38 kernel headers, so this symbol should be
> here. Except that the <linux/tty.h> of this toolchain is basically
> empty:
>
> ===
>
> #ifndef _LINUX_TTY_H
> #define _LINUX_TTY_H
>
> /*
>  * 'tty.h' defines some structures used by tty_io.c and some defines.
>  */
>
> #endif
>
> ===
>
> So either I'm looking incorrectly, or those headers look broken.

I'll try to fix this issue.

Yegor
