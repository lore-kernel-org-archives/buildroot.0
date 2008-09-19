From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Sep 2008 14:48:21 +0200
Subject: [Buildroot] make commands for parts of buildroot?
In-Reply-To: <48D355FD.4030502@eubus.net>
References: <48D355FD.4030502@eubus.net>
Message-ID: <20080919124821.GB11755@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 19, 2008 at 09:34:21AM +0200, Lars Lockenvitz wrote:
>Hello,
>
>I have a question!
>Are there commands to rebuild parts of busybox?

you can generally do
$ make foo-clean && make foo
Note that foo-dirclean deletes the whole sourcestree of foo, so make
sure to save any change you did to a corresponding
foo-descriptive-description.patch.

Also note that in order to configure busybox with the correct settings
you are supposed to run 'make busybox-menuconfig'. See docs/README

>For example:
>I change some settings of busybox using make menuconfig or edit .c file direktly.
>Now I want that these .c files or the busybox will be compile. But make only creates me the rootfs, but whitout these changes.
>
>Most interesstings commands are for cleaning busybox, rootfs, or linux-kernel and make them, but to have the option to make only one of them if needed!

the kernel is the one exception. It's clean target is called
linux26clean (i.e. no dash!) for reasons explained near that target.
HTH,
