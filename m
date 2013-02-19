From: Gregory Perry <Gregory.Perry@govirtual.tv>
Date: Tue, 19 Feb 2013 23:03:41 +0000
Subject: [Buildroot] Advice on buildroot implementation
Message-ID: <718DFA7882181D45B8BD18F31C46D55427A6A8E3@MBX204.domain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

Does anyone have some advice on using buildroot to create a LiveCD filesystem?

Here are the requirements:

1) Universal boot support on any x86 hardware platform;
2) Read only (UnionFS or OverlayFS); and
2) NFS root capabilities after kernel/initrd launch (if the ISO is PXE-boostrapped)

The problems I am seeing with this approach so far (at least from the NFS 
root perspective) is that things like /lib/firmware are not accessible during the
boot process which hangs the boot process.

Has anyone successfully created a buildroot install that can be used over a 
read only NFS mount?  How did you get around issues like eth0 firmware not
being accessible during the initial boot?

Thanks in advance
