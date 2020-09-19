From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 19 Sep 2020 19:59:44 +1200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-18
In-Reply-To: <CAFOYHZDhc1KX5tEhobOgqpZ+P89xH=26oNXgv162iAEbU7taBg@mail.gmail.com>
References: <5f65af16.1c69fb81.8e15f.d9b0SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZDhc1KX5tEhobOgqpZ+P89xH=26oNXgv162iAEbU7taBg@mail.gmail.com>
Message-ID: <CAFOYHZByBuOvAv9G770mvNe1AFQ9y1LUsbE-BNTpsoQBjDBe0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, sorry for the spam, didn't notice that the messages weren't Cc'd to
the br list.

On Sat, 19 Sep 2020, 7:11 PM Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |
>            url
>
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arm      |        micropython-1.13        |
> http://autobuild.buildroot.net/results/873786196e6b7975234bcb7b010d0dc00b3acbdc
>     arm      |        micropython-1.13        |
> http://autobuild.buildroot.net/results/cea4316033f81014e08d2039bd89647a23fa6dd0
>     arm      |        micropython-1.13        |
> http://autobuild.buildroot.net/results/0580ff521a9aaaed3a21b15c1ee28b66f5c2c7c9
>    xtensa    |        micropython-1.13        |
> http://autobuild.buildroot.net/results/f87c18b7854342baea137d9b7b9a79aa5a7e4f63
>
>
> --
> http://autobuild.buildroot.net


The builds are failing with "arm-none-linux-gnueabi-gcc: error:
unrecognized command line option '-Wfloat-conversion'". This was recently
added to the micropython Makefiles. I haven't tracked down when this was
added to gcc but it looks like whatever version is used by these configs it
doesn't recognize it.

The simple fix is to require a sufficiently new gcc version. I'll see if i
can get to it this weekend unless someone beats me to it.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200919/7d3f4f4d/attachment.html>
