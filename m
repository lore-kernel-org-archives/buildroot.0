From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 11 Apr 2011 11:53:15 +0200
Subject: [Buildroot] Starting programs in the background at init time:
 stdin EOF problem
In-Reply-To: <BANLkTi=qUjcrhX92_WCRXyaCSNxwscDtPA@mail.gmail.com>
References: <BANLkTi=Vx9c7OJ0arjwmrr6=WcTYFUfpyA@mail.gmail.com>
	<BANLkTi=qUjcrhX92_WCRXyaCSNxwscDtPA@mail.gmail.com>
Message-ID: <BANLkTimN8OJvrnFvW=BeLrCsuTB6-7ZxDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hej Daniel!

2011/4/11 Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
> Hi Thomas!
>
> 2011/4/11 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
>> What is the recommended way to start programs in such an embedded
>> environment?
>
> I'm using start-stop-daemon to perform similar tasks. Have you given
> it a try? It can "daemonize" even non-daemons which is pretty nice for
> e.g. GUI softwares.
>

Thanks for the hint.
I just gave it a try as follows:
# start-stop-daemon  -S -x ./shell  --background

Unfortunately, it seems to have the same problem. By daemonizing, the
file descriptor stdin seems to be closed, so my test program loops
forever (which I was able to visualize with strace).

I may need to adapt my program to not use stdio, but rather other
filedescriptors. I suppose that they will not be impacted be
foreground/background issues?



Where do you start start-stop-daemon from? Directly from inittab or
from scripts in /etc/init.d?
How do you start other programs automatically?

Thanks,
Thomas
