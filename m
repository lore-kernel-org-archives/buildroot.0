From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Sun, 28 Apr 2013 08:50:58 +1000
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <20130427193407.0e7423c6@skate>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
Message-ID: <klhkoe$dak$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> This worked (it mounted the filesystem) but it doesn't seem to be able to
>> run the init binary (in this case Busybox built by buildroot.)  Looking at
>> tcpdump it correctly follows the symlinks and appears to download the busybox
>> binary, but then fails saying it couldn't find init.
>
> Again, please post your Buildroot .config and kernel .config. Another
> issue you might be having if you're building your kernel outside of
> Buildroot is that you may have enabled the usage of devtmpfs as
> the /dev strategy, but forgot to enable CONFIG_DEVTMPFS and
> CONFIG_DEVTMPFS_MOUNT in your kernel configuration. See
> http://buildroot.org/downloads/manual/manual.html#_dev_management for
> more details.

Sorry, I didn't post them because I didn't think it would be easy to solve - 
here they are:

   http://www.shikadi.net/files/buildroot/2013-04-28.br.cannot_run_init.config
   http://www.shikadi.net/files/buildroot/2013-04-28.k.cannot_run_init.config

I don't think it's an issue with /dev as I don't think the kernel gets that 
far in the boot process.  I am building the kernel outside of buildroot while 
I'm testing (and I can only do OABI here) but I also copied my changes across 
and built it through buildroot (so I could enable EABI in the kernel config) 
but there was no change.

I'll keep investigating, but let me know if you have any insight!

Many thanks,
Adam.
