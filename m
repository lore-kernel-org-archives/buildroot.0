From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 25 May 2015 17:55:46 +0200
Subject: [Buildroot] BR 2015.02: questions re builds for a B3?
In-Reply-To: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
References: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
Message-ID: <CAGm1_kswdDzE4C1QrxEjHvcfnV2KRe7Weu9J87br7NgF_HdPFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 25, 2015 at 5:45 PM,  <g4@novadsp.com> wrote:
> There might be some really dumb questions in this so apologies in advance.
>
>
>
> Aside from problems with the default uEnv.txt I can build a booting system
> using 2015.02. For which many thanks.  I?ve currently got 3 problems. Any
> help here much appreciated.
>
>
>
> 1. How to point BR to use a newer kernel (TI 3.14.43 in this case)? Which
> menuconfig setting(s) need to be changed and what would the resulting
> .config look like?
>
>
>
> If I simply replace the commit hash when I makeconfig with the branch number
> I get the (painful!) result in the appended snippet below

What about just using upstream kernel? Select 4.0.4,
omap2plus_defconfig and am335x-boneblack.dtb and you're done.

> 2. If I configure the default kernel (3.12.10 ish) to build (specifically)
> USB gadget modules, modprobe and friends do not work on the target. The .ko
> modules are in the expected folder but somewhere a step is getting missed.
> Any thoughts?
>
>
>
> 3. If I even need to do this by hand, how do I set up
> /etc/network/interfaces to use etho? Does this need a custom script or can
> it be added to some default file somewhere? Or, can I create an interfaces
> file in $BUILDROOT /board/beaglebone?
>
>
>
> 4. Is there an officially sanctioned way to get a complete log of all build
> steps? Redirection to stdout/stderr is a bit brittle. And I?d prefer to
> avoid hacking remake or pymake
>
>
>
> 5. More generally, which .config files need to be backed up? I get
> $BUILDROOT but how about for the kernel?

http://nightly.buildroot.org/manual.html#outside-br-custom

> Thanks very much for any help here.
>
>
>
> The extraordinarily maddening error follows. The problem here is that if I
> rerun make the entire repo is cloned once more. Is this intentional? How can
> it be stopped. My broadband is slow so a 3 hour clone is a complete pain?.
>
> ----------------------------------------snip------------------------------------------
>
>>>> linux linux-3.14.41-ti-r63 Downloading
>
> Doing full clone
>
> Cloning into bare repository 'linux-linux-3.14.41-ti-r63'...
>
> remote: Counting objects: 4862708, done.
>
> remote: Compressing objects: 100% (721124/721124), done.
>
> remote: Total 4862708 (delta 4114542), reused 4854896 (delta 4107066)
> Receiving objects: 100% (4862708/4862708), 942.31 MiB | 294.00 KiB/s, done.
>
> Resolving deltas: 100% (4114542/4114542), done.
>
> Checking connectivity... done.
>
> fatal: Not a valid object name
>
> --2015-05-21 17:48:58--
> http://sources.buildroot.net/linux-linux-3.14.41-ti-r63.tar.gz
>
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
> Connecting to sources.buildroot.net
> (sources.buildroot.net)|176.9.16.109|:80... connected.
>
> HTTP request sent, awaiting response... 404 Not Found
>
> 2015-05-21 17:48:59 ERROR 404: Not Found.
>
>
>
> make: ***
> [/home/xxx/buildroot/output/build/linux-linux-3.14.41-ti-r63/.stamp_downloaded]
> Error 1
>
> ----------------------------------------/snip------------------------------------------
>
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
