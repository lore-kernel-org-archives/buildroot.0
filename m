From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Mar 2020 08:02:41 +0000
Subject: [Buildroot] [Bug 11866] iniramfs file system fails to boot using
 Grub on EFI x86_64
In-Reply-To: <bug-11866-163@https.bugs.busybox.net/>
References: <bug-11866-163@https.bugs.busybox.net/>
Message-ID: <bug-11866-163-EcE820QAZK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11866

Timo Ketola <timo.ketola@exertus.fi> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |timo.ketola at exertus.fi

--- Comment #4 from Timo Ketola <timo.ketola@exertus.fi> ---
This sounds very much like what I observed too. When I try to boot an ARM
system with U-Boot and with 'silent' flag set, /init fails, kernel panics and
the local display is left with a cursor alone (I watch the kernel messages from
the serial line). U-Boot's 'silent' flag makes it to adjust kernel command line
with 'console=<empty>'.

Here is a proposed patch:

https://patchwork.ozlabs.org/patch/1166017

-- 
You are receiving this mail because:
You are on the CC list for the bug.
