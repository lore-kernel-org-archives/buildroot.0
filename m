From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Nov 2015 23:34:30 +0100
Subject: [Buildroot] BR2_ROOTFS_MERGED_USR and gdb
In-Reply-To: <878u5kv4js.fsf@dell.be.48ers.dk>
References: <CAMOMa6N-h2JaWhA96f2JE12Nq1i4aFC2p8t4LLDB1X44Txh3Rg@mail.gmail.com>
 <878u5kv4js.fsf@dell.be.48ers.dk>
Message-ID: <20151126223430.GB3724@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pieterjan, Peter,

On 2015-11-26 22:23 +0100, Peter Korsgaard spake thusly:
> >>>>> "Pieterjan" == Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com> writes:
> 
>  > Hi,
>  > Since the introduction of BR2_ROOTFS_MERGED_USR, /lib is now a symlink
>  > to /usr/lib on the target. In the sysroot directory however, /lib and
>  > /usr/lib are separate directories.
> 
>  > When remote debugging, this causes gdb to search only for libraries in
>  > /lib under the sysroot directory.
>  > Is there a way to fix this situation other than using "set solib-search-path"?
> 
> Thanks for the report. I guess we'll need to do the same merged-usr
> handling (and workarounds) we do for the target directory also for
> staging.
> 
> Yann is looking into it, but it is nontrivial so it will most likely not
> make it for 2015.11.

It turned out to (hopefully) be much easier than I expected.

Pieterjan, care to test the series I just sent (in which you were CCed),
please, and report whether it fixes it for you or not? Thanks!

FTR:
    https://patchwork.ozlabs.org/patch/549237/
    https://patchwork.ozlabs.org/patch/549238/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
