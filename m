From: mojtaba <kernelppc@gmail.com>
Date: Fri, 4 Jan 2008 18:57:48 +0100
Subject: [Buildroot] Filesystem problem
In-Reply-To: <fa686aa40801021054y64b480d0ldbb80ef2c98e5afa@mail.gmail.com>
References: <002e01c84d4c$11ff0cc0$35fd2640$@com>
	<fa686aa40801021054y64b480d0ldbb80ef2c98e5afa@mail.gmail.com>
Message-ID: <009701c84efb$52236bb0$f66a4310$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thank you for your helps.

Today I tried to make the file system again using buildroot. This time I
included busybox to the packages for target system (Before that, I did not
include the busybox). Surprisingly the system boot correctly.

But, I do not want to use busybox. I already compiled coreutils and I want
to put them on my target system. After building the root file system I tried
to replace those symbolic links to busybox(such as ls, cp, ...) with the
real commands from coreutils but I got this error.

Freeing unused kernel memory: 76k init
missing file opeKernel panic - not syncing: Attempted to kill init!
rand
Try `/bin/Rebooting in 180 seconds..sh --help' for more information.

So, how can I use coreutils instead of busybox?

Regards,
Mojtaba

-----Original Message-----
From: glikely@secretlab.ca [mailto:glikely at secretlab.ca] On Behalf Of Grant
Likely
Sent: Wednesday, January 02, 2008 7:55 PM
To: mojtaba
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Filesystem problem

On 1/2/08, mojtaba <kernelppc@gmail.com> wrote:
> Dear all,
>
> I am trying to boot a root file system build by buildroot. But I got this
> error" init has generated signal 11 but has no handler for it".
>
> My kernel version is 2.6.24-rc3
> My target system is PPC 405 (XILINX VIRTEX II pro)
> I am using the 26-12 snapshot of buildroot
>
<snip>
>
> mice: PS/2 mouse device common for all mice
> VFS: Mounted root (ext2 filesystem) readonly.
> Freeing unused kernel memory: 76k init
> Warning: unable to open an initial console.
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
You probably don't have /dev/console in your root filesystem.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
grant.likely at secretlab.ca
(403) 399-0195
