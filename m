From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jan 2015 12:03:01 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
In-Reply-To: <trinity-1952e396-b250-47cb-af17-8f840cae0bc2-1420852412854@3capp-gmx-bs28>
References: <trinity-1952e396-b250-47cb-af17-8f840cae0bc2-1420852412854@3capp-gmx-bs28>
Message-ID: <20150110110301.GA3934@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-01-10 02:13 +0100, Peter Seiderer spake thusly:
[--SNIP--]
> Thanks, great work. My RaspberryPi B+ booted with the new linux-kernel/DT support.

Thanks for the report. Great! :-)

> The only thing I had to change is the kernel compression standard
> (in the kernel config file) from CONFIG_KERNEL_XZ=y to CONFIG_KERNEL_GZIP=y
> because otherweise the script mkknlimg failed with:
> "* Is this a valid kernel? In pass-through mode."

Weird, it is working for me... 

> Maybe some uncompress tool is missing or is to old on my host?

My xz is:

    $ xz --version
    xz (XZ Utils) 5.1.0alpha
    liblzma 5.1.0alpha

Can you check that your xz supports the --single-stream option?

> Is
> it possible to run mkknlimg automatically (with buildroot host/usr/bin path)
> to avoid such errors (and avoid someone installing zImage without running
> mkknlimg)?

OK, so it seems you do not have xz on your host, and that you rely on
the one built by Buildroot, right?

And no, it is not possible to do it in the current Buildroot
infrastructure:

  - there's no way a package can declare hook (whichever) for another
    package,

  - we do not want to add anything platform-specific to the kernel.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
