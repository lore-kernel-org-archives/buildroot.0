From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Mon, 26 Dec 2011 14:42:14 +0100
Subject: [Buildroot] Buildroot 2011.11 on x86_64 - neither udev nor mdev
 loads needed modules at startup
In-Reply-To: <CAMduVEdmasu=7LYzR7AkGO9amtOLV7L3AYxBJJ6+9_jhhk7LAA@mail.gmail.com>
References: <CAMduVEdmasu=7LYzR7AkGO9amtOLV7L3AYxBJJ6+9_jhhk7LAA@mail.gmail.com>
Message-ID: <4EF879B6.8080902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've found one problem with /etc/init.d/S10udev script:

Instead of:
  udevadm control --stop_exec_queue
There should be:
  udevadm control --stop-exec-queue

However it doesn't solve the main issue...
-- 
Regards,
Wojtek
