From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 20:44:42 +0000
Subject: [Buildroot] [Bug 9541] Platform drivers autoloading from info in
 device tree does not work
In-Reply-To: <bug-9541-163@https.bugs.busybox.net/>
References: <bug-9541-163@https.bugs.busybox.net/>
Message-ID: <bug-9541-163-HsWN9ztNS7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9541

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
It is hard to know what is going on without more details.

For drivers to load automatically, you need:

- Device tree snippet according to the defined bindings (in your case it sounds
like Documentation/devicetree/bindings/net/microchip,enc28j60.txt)

- Driver enabled as a module in the kernel

- A user space kernel module loader, E.G. mdev or (e)udev

If you still have problems, please provide more details about the above.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
