From: Javier Alejandro Saenz Leguizamon <jasaenzl@unal.edu.co>
Date: Mon, 9 Dec 2013 13:53:18 -0500
Subject: [Buildroot] OpenVPN doesn't start
Message-ID: <CALADVSN=r5a_LrowrHVnrGNYt6APYUidHm7GRwQc3upCVYhxKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I'm always getting this error when start my Open VPN client:

/etc/init.d/S60openvpn  start
Starting openvpn: FAILED-> server.

I check the log (/var/log/openvpn.log) and it seems the problem is LZO
compression.

Thu Jan  1 00:41:12 1970 us=447937 OpenVPN 2.3.2
armeb-buildroot-linux-gnueabi [SSL (OpenSSL)] [LZO] [EPOLL] [MH] [IPv6]
built on Dec  4 2013
Thu Jan  1 00:41:12 1970 us=449843 WARNING: No server certificate
verification method has been enabled.  See
http://openvpn.net/howto.html#mitm for more info.
Thu Jan  1 00:41:12 1970 us=471562 Cannot initialize LZO compression library
Thu Jan  1 00:41:12 1970 us=471968 Exiting due to fatal error

so I check the menuconfig and is enabled,  and now I dont know what to do,
can anyone help me pls.

I'm using codesourcery 2013.05 toolchain and buildroot-2013.08.1, I'll
attach my .config.

thank you very much for your help



Javier Alejandro S?enz Leguizam?n
Ingeniero Electr?nico
Universidad Nacional de Colombia
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131209/2fce6190/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 32060 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131209/2fce6190/attachment-0001.obj>
