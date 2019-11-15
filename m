From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Sat, 16 Nov 2019 00:04:59 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <20191115220834.56a3e732@windsurf.home>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
 <20191111213154.19409-2-avraham.shukron@gmail.com>
 <20191112220534.531a470f@windsurf>
 <CAJX3zAuwNz7zzdrxupT+o_ZWR7AYRrk6h1XpRuYHk778pMU0ZQ@mail.gmail.com>
 <20191115220834.56a3e732@windsurf.home>
Message-ID: <CAJX3zAv9dAhtoiAUn-5sRFE1QOMWKK_G8P6yD1wqK25hpkq=hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 15, 2019 at 11:08 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:
> True. But then, how did you get build issues when building qemu ? I
> mean, your v3 in fact doesn't do anything really: host-python3 was
> already built as one of the dependencies of qemu, through libglib2. So
> how did you get issues ?

Damn, you are right, host-python3 won't work.
I've managed to build it only because I had host-python(2) still installed
in my host dir during my experiments.
A clean build still fails because there is no "python" executable in the
host dir unless you build any python for
the target.

So we only left with your suggestion, that in the best case (python3 is
selected for the target)
will only build host-python3.
Any other case will force both host-python and host-python3 to be built.

So I'll re-submit with your $(if..) solution soon.

> We discussed this at the latest Buildroot Developers meeting, you can
> see some notes in "Python 2 deprecation" at
> https://bimestriel.framapad.org/p/buildroot-elce-2019-meeting. We
> welcome contributions in this area.

Great, I'll try to put  some work into that.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191116/34ead835/attachment.html>
