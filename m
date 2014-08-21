From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Aug 2014 12:20:47 +0200
Subject: [Buildroot] My own init. How?
In-Reply-To: <CAEzGmjCb2F_8vMuSkVYF5MNwKk-Qxt5Snx9pOJ-eozFpLz+Xuw@mail.gmail.com>
References: <CAEzGmjCb2F_8vMuSkVYF5MNwKk-Qxt5Snx9pOJ-eozFpLz+Xuw@mail.gmail.com>
Message-ID: <20140821102047.GD3891@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lennart, All,

On 2014-08-21 10:37 +0200, Lennart Ramberg spake thusly:
> I built a system successfully and used grub-bios-setup;
> $ sudo ./output/host/usr/sbin/grub-bios-setup -b
> ./output/host/usr/lib/grub/i386-pc/boot.img -c ./output/images/grub.img -d
> . /dev/sdX
> I have disabled the 'Run a getty (login prompt) after boot.'
> 
> When my targetsystem thus has booted, I get a blank line.
> Typing echoes to the display including pressing Enter giving a new blank
> line.
> That seems well, though I don't know what to expect to see from Busybox
> init.
> 
> Now, I want to try my own init, a 'Hello, world'. Busybox FAQ says: '...
> boot your device with an "init=" argument pointing to your hello world
> program'.
> How do I do that?

You should pass this 'init=/path/to/your/hello-world' on the kernel
command line.

Since you're using grub, you need to edit output/target/boot/menu.lst .

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
