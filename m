From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 09:16:11 +0200
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
Message-ID: <20140416091611.03ce43f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Wed, 16 Apr 2014 11:21:25 +0900, Rohit Kumar wrote:

> i used buildroot to make toolchain and file system.
> i used toolchain to compile the kernel source given by processor
> manufacturer.
> kernel compiled successfully and boots fine but the file system generated
> by buildroot doesnt work.
> 
> and gives following error:
> 
> VFS: Mounted root (nfs filesystem) on device 0:13.
> devtmpfs: mounted
> Freeing init memory: 480K
> Kernel panic - not syncing: Attempted to kill init!

Can you give us:

 * The platform you're using, so that we can figure out which processor
   it is using.

 * The Buildroot .config file you're using, to check that the
   configuration you've made matches the processor of your platform.

Most of the time, those errors are due to inadequate architecture
variant / floating point configuration.

Also, how did you prepare your NFS filesystem? By just copying
output/target, or by following the instructions at
http://buildroot.org/downloads/manual/manual.html#_nfs_boot ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
