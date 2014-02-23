From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 15:56:30 +0100
Subject: [Buildroot] Open bug analysis (Feb 20)
In-Reply-To: <CAAXf6LWMuQACfLPO3DzZYSriOFndL+r7FhCPRHiidG-w2PsOVg@mail.gmail.com>
References: <CAAXf6LWMuQACfLPO3DzZYSriOFndL+r7FhCPRHiidG-w2PsOVg@mail.gmail.com>
Message-ID: <CAAXf6LWBzDtXZYyF_6dHXKorCr5KA5N7Pq7pQJGp6LCUQrUyWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Feb 21, 2014 at 8:57 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> We have been able to close many bugs already, 21 bugs remaining, of which:
> - 7 new package requests (patches often available)
> - 2 indicators of disabled builds on some arch (dmraid, gpsd)
>
> *Bugs for which an action is already proposed*.
> Feedback on this is requested: do you agree or not with the proposed action?
>
> Dbus and /var/run management
> https://bugs.busybox.net/show_bug.cgi?id=5420
> Here I don't see what the problem is. It is about the creation of
> /var/run/dbus while /var/run is a symlink to /tmp. Looking at the
> code, I don't see how it can be a problem (which I responded in the
> bug report). Unless someone can explain what is going wrong exactly, I
> would propose to close this (Resolved/Worksforme for example).
> Do you agree?
>
> Support for kernel signed modules
> https://bugs.busybox.net/show_bug.cgi?id=6764
> Arnout suggested to close this bug explaining the submitter that this
> is a kernel problem, not something we can solve in buildroot. This is
> fine by me.
> Do others agree?
>
> Busybox compiled from buildroot hangs on pass from intiramfs to init
> https://bugs.busybox.net/show_bug.cgi?id=6794
> The submitter claims that stripping the busybox binary causes
> incorrect runtime behavior. I asked for more info, but no response. I
> would propose to close this as Worksforme.
>

Above bugs are closed now.

>
> *Bugs that have patches attached that should be sent to the list (not
> package patches)*: (adopters welcome)
>
> procps Unknown HZ value! (XX) Assume 100.
> https://bugs.busybox.net/show_bug.cgi?id=6626
> ThomasP proposed to replace procps with procps-ng, the submitter
> provided a patch, but did not send it to the list.
>
>
> *Bugs needing investigation*
>
> Checking external toolchain for eabihf
> https://bugs.busybox.net/show_bug.cgi?id=6842
>
> Running udhcpc on a system with NFS root kills NFS
> https://bugs.busybox.net/show_bug.cgi?id=4790
>
> Boot hangs when starting samba if BR2_ENABLE_LOCALE is enabled
> https://bugs.busybox.net/show_bug.cgi?id=5396
>
> config flags to the Xenomai build system
> https://bugs.busybox.net/show_bug.cgi?id=5900
>
> Cannot compile gcc without threads (uClibc-based)
> https://bugs.busybox.net/show_bug.cgi?id=6230
>
>
> *Bugs under investigation by someone already*:
>
> Doing a Buildroot build from /usr doesn't work
> https://bugs.busybox.net/show_bug.cgi?id=5750
> This bug is under investigation by myself, it won't be done before
> 2014.02 though.
>
> Not able to build ALSA-Lib for static build
> https://bugs.busybox.net/show_bug.cgi?id=5768

Bug fixed now.

> and
> Not able to build ALSA-Utils for static build
> https://bugs.busybox.net/show_bug.cgi?id=5774
> I have sent patches that fix these problems and received some
> feedback, that I will address. However, it will not be for 2014.02
> anymore.

Bug closed as wontfix, should be fixed upstream first.

Best regards,
Thomas
