From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Jan 2011 19:41:23 +0100
Subject: [Buildroot] Enabling NFS
In-Reply-To: <89359.48464.qm@web161810.mail.bf1.yahoo.com> (Steve Calfee's
	message of "Wed, 26 Jan 2011 10:20:22 -0800 (PST)")
References: <89359.48464.qm@web161810.mail.bf1.yahoo.com>
Message-ID: <87y667tsmk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <nospamcalfee@yahoo.com> writes:

 Steve> Hi,

 Steve> I have just spent some time trying to enable NFS on a beagle
 Steve> board. It seems that RPC is required for nfs.

You have to make the distinction between boot-from-nfs and being able to
mount nfs shares at runtime. For both you need kernel support for NFS,
but:

1: boot-from-nfs needs CONFIG_ROOT_NFS and CONFIG_IP_PNP (and
   IP_PNP_DHCP for most setups) enabled in the kernel and no changes in
   userland.

2: runtime nfs support needs RPC support in C library and NFS support in
   busybox mount command (automatically enabled if you used the standard
   busybox config).

The bootloader doesn't need any changes for either of these (with the
possible exception of a modification of the kernel cmdline).

This is not really related to buildroot though (except for the automatic
enabling of NFS support in busybox mount if the C library has RPC
support).

-- 
Bye, Peter Korsgaard
