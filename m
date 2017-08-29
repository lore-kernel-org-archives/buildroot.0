From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Aug 2017 14:57:10 +0000
Subject: [Buildroot] [Bug 10261] Grub2 fails to build for x86_64
In-Reply-To: <bug-10261-163@https.bugs.busybox.net/>
References: <bug-10261-163@https.bugs.busybox.net/>
Message-ID: <bug-10261-163-gpvN5m8Nuy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10261

--- Comment #5 from Erico Nunes <nunes.erico@gmail.com> ---
I am able to reproduce the issue with your config, running Fedora 26 if that
matters. Had to remove some of your user specific settings such as ones
pointing to your BR2_EXTERNAL, but nevertheless reproduced:

> checking whether -fno-asynchronous-unwind-tables works... yes
> checking whether -fno-unwind-tables works... yes
> checking for target linking format... unknown
> configure: error: no suitable link format found

I retested and am not able to reproduce a grub2 build failure with
pc_x86_64_efi_defconfig, so it must be one of your changes.

So now we need to narrow down which of your changes caused this, might be the
changes in the grub2 config or more likely some of your optimization settings.

Also we might consider retesting this with the v2 patchset on patchwork at [1]
since it did some better separation between the host part and target part of
grub2 which I wouldn't discard being a cause here (this would be one more
reason to have something like that merged). I plan to respin that for 2017.11.


[1]
https://patchwork.ozlabs.org/project/buildroot/list/?submitter=46481&q=grub2&archive=&delegate=&state=*

-- 
You are receiving this mail because:
You are on the CC list for the bug.
