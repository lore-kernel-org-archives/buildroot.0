From: Cameron Hutchison <lists@xdna.net>
Date: Fri, 19 Feb 2010 23:31:16 -0000
Subject: [Buildroot] create device nodes,
	edit mini_device_table.txt (cross compilation for an ARM)
References: <SNT129-W625BE919D415C537295C37B9460@phx.gbl>
Message-ID: <4c4c.4b7f1f44.ba5e5@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tony Mozi <spooflinux@hotmail.fr> writes:

>In fact, if I modify the mini_device_table.txt there is no effect.
>But if I modify device_table.txt, it's ok, the node is created.
>What is the difference between the two files??

Have a look in target/generic/Makefile.in where it selects which of the
files to use. It depends on whether you have selected
BR2_PACKAGE_BUSYBOX_SKELETON when configuring busybox.
