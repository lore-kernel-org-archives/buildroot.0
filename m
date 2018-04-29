From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Apr 2018 10:17:37 +0200
Subject: [Buildroot] [RFC v1 1/2] libopenssl: bump version to 1.1.0h
References: <20180417211921.18718-1-ps.report@gmx.net>
 <0a63a86c-322f-6508-5cc3-5a37ff0e5dad@gmail.com>
Message-ID: <1mbgrexjul.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 20 Apr 2018 08:29:52 -0700 schrieb Ryan Coe:

> I'm also getting the following error on host-libopenssl:
[...]
> *** ERROR: package host-libopenssl installs executables without proper
> RPATH:
> ***?? /home/ryan/devel/buildroot/output/host/bin/openssl

Hi,

adding

	-Wl,-rpath,'$(HOST_DIR)/lib' \

to HOST_LIBOPENSSL_CONFIGURE_CMDS fixes the problem for me.
For details read host-libopenssl-1.1.0h/NOTES.UNIX.

Regards, Bernd
