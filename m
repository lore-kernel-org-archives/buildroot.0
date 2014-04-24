From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 22:00:48 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support
	for kernels older than 3.x.
In-Reply-To: <OF203E3A69.EF307CEE-ON86257CC4.006C7E39-86257CC4.006CBA0C@rockwellcollins.com>
 (Ryan Barnett's message of "Thu, 24 Apr 2014 14:47:42 -0500")
References: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20140418213924.6d5a3ebf@skate> <53564749.5060409@lucaceresoli.net>
 <OF4212D2FC.25E3AE63-ON86257CC3.004F7CF7-86257CC3.007CFC5D@rockwellcollins.com>
 <87bnvr2ped.fsf@dell.be.48ers.dk>
 <OF203E3A69.EF307CEE-ON86257CC4.006C7E39-86257CC4.006CBA0C@rockwellcollins.com>
Message-ID: <87lhuu1or3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

Hi,

 >> > was no way to not include this kernel config option when
 >> > BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.
 >> 
 >> Huh, but we ONLY enable it if BR2_ROOTFS_DEVICE_CREATION_STATIC isn't
 >> enabled - So why not just enabled it?

 > I meant to say, "when BR2_ROOTFS_DEVICE_CREATION_STATIC is NOT enabled". 
 > Sorry for the confusion and thanks for the clarification.

Ok, but the point of the other options are that they REALLY need
devtmpfs support in the kernel, so if you don't want to use that then
you should really select static /dev.

mdev could be made to work without devtmpfs, but not in the setup we
support.

-- 
Bye, Peter Korsgaard 
