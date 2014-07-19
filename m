From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 17:41:11 +0200
Subject: [Buildroot] Raspberry + Usb to TTL Serial Cable issue
In-Reply-To: <CAK9TtU1h3RZ=j1cDXD24KjHxTMNzZbZb2w6XuqO0XNr+RXotEw@mail.gmail.com>
References: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
 <20140719160709.2b2bcfae@free-electrons.com>
 <CAK9TtU06LT6oep-7sYZTVjpVqRbc-DN0pCMrK28f230dTirupA@mail.gmail.com>
 <20140719171333.2a67eb5d@free-electrons.com>
 <CAK9TtU1h3RZ=j1cDXD24KjHxTMNzZbZb2w6XuqO0XNr+RXotEw@mail.gmail.com>
Message-ID: <20140719174111.79e82033@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain LG,

On Sat, 19 Jul 2014 17:35:42 +0200, Sylvain LG wrote:
> I changed tty1 to ttyAMA0 and I can log now.
> 
> Only kernel messages are displayed, but no daemons messages (for instance,
> "Starting sshd" or the public/private key pair generation).
> 
> Why?

Those messages are displayed on the console, so if you have
console=<your serial port> you should see them.

> Can Buildroot be set to configure more than one tty?

There are two separate things:

 */ The kernel console. This one is configured using the console=
    kernel parameter, and you can have potentially several ones. This
    is where the kernel messages go, as well as the messages of all
    userspace processes that do not explicitly define a tty
    in /etc/inittab.

 */ The tty on which getty processes are started (getty is the program
    that asks for a login). By default, Buildroot only starts one, but
    you can create your own /etc/inittab (stored for example in a root
    filesystem overlay), and in this case you can start as many getty
    programs as you want, on whichever ttys you want.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
