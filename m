From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 22:00:00 +0200
Subject: [Buildroot] [PATCH] Makefile: Update mtime of $(TARGET_DIR)/usr
In-Reply-To: <ebcdd3fe-3a9c-c54e-1cda-d36051db7775@licor.com>
References: <20180416153339.23002-1-chris.lesiak@licor.com>
 <20180416201823.GD2290@scaer>
 <3b2d2a19-20ef-60dd-4a21-112cacff0c53@licor.com>
 <20180422213741.GJ12688@scaer>
 <ebcdd3fe-3a9c-c54e-1cda-d36051db7775@licor.com>
Message-ID: <20180428200000.GC2922@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2018-04-24 13:56 -0500, Chris Lesiak spake thusly:
> >     date    what
> >     0       build version 1
> >     1       version is flahes onto a device, boxed and shipped
> >     2       build version 2
> >     3       the device with version 1 is received, unboxed and booted
> >     4       that device downloads version 2 and updates to it
> >
> >As you can see, the /etc/.updated and/or /var/.updated will dated '3'
> >but the mtime of /usr version 2 will be 2 (because touched at build
> >time).
> 
> Not quite.
> 
> If systemd-update-done if working correctly, then on date 3, /etc/.updated
> and /var/.updated will get created with mtime 0, not mtime 3.? Then on date
> 4, /etc/.updated and /var/.updated will get updated (because 0 is less than
> 2) to mtime 2.
> 
> When /etc/.updated and /var/.updated are originally created and then again
> when they are updated, their mtime will match the mtime of /usr, not the
> current time when systemd-update-done runs.

OK, makes sense. Thanks for the clraification.

So, this touch is eventually mostly usefull for a read-only rootfs, in
fact (for a read-only rootfs, the touch could be done by the update
mechanis).

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
