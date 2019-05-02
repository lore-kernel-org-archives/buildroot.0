From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 May 2019 14:32:46 +0000
Subject: [Buildroot] [Bug 11766] Console (getty) issues with systemd
In-Reply-To: <bug-11766-163@https.bugs.busybox.net/>
References: <bug-11766-163@https.bugs.busybox.net/>
Message-ID: <bug-11766-163-J8ZPeFqbKv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11766

--- Comment #1 from khozaei <iot@iotasoft.ir> ---
Created attachment 7986
  --> https://bugs.busybox.net/attachment.cgi?id=7986&action=edit
getty options changed from -L to -h

I found the solution finally.

I added `--flow-control` option to agetty in `serial-getty at .service` and this
option fixed my problem.

> **-h, --flow-control** 

> Enable hardware (RTS/CTS) flow control. It is left up to the
> application to disable software (XON/XOFF) flow protocol where
> appropriate.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
