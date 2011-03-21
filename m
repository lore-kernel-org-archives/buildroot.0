From: bruce bushby <bruce.bushby@gmail.com>
Date: Mon, 21 Mar 2011 16:32:02 +0000
Subject: [Buildroot] Python: can't resolve symbol
In-Reply-To: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
References: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
Message-ID: <AANLkTi=yxFpMFoXnRErXd8iz1yhQw6gqbvv7Ns8-T6D3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've been having a problem compiling python "readline" module. If I include
the readline python module in my config, I get symbol errors when I start a
python interactive shell.

As a test, I stripped all python and readline from my build "host"
machine....but buildroot complains that it's can't find python. I'm guessing
this is due to the "host-python" directive?

Since my build machine is 32bit Intel and my embedded board/target is
ARM.....why would I need a local install of python to download and compile
python for ARM?

I'm suspecting that python is compiling against my "host's" readline library
and not the readline that should have been compiled for my ARM
target...which I think is what is causing the symbol errors.

So far I've tried the "latest stable" release and the "daily snapshot" on:
Fedora 12 (64bit)
Fedora 14 (32bit)  <-- my current build host
Ubuntu Natty


Bruce







On Tue, Mar 8, 2011 at 8:20 AM, bruce bushby <bruce.bushby@gmail.com> wrote:

> Hi
>
> I'm not sure if this is the right list to post this issue to?
>
> From what I can tell, these "can't resolve" messages are caused when
> selecting "readline"
>
>
> # python
> Python 2.7.1 (r271:86832, Mar  7 2011, 22:37:34)
> [GCC 4.5.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>
> python: symbol 'BC': can't resolve symbol
>
> python: symbol 'PC': can't resolve symbol
>
> python: symbol 'UP': can't resolve symbol
>
> python: symbol 'tgetnum': can't resolve symbol
>
> python: symbol 'tgoto': can't resolve symbol
>
> python: symbol 'tgetflag': can't resolve symbol
>
> python: symbol 'tputs': can't resolve symbol
>
> python: symbol 'tgetent': can't resolve symbol
>
> python: symbol 'tgetstr': can't resolve symbol
> >>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110321/6389907a/attachment.html>
