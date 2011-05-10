From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 11 May 2011 01:11:32 +0400
Subject: [Buildroot] stunnel package
Message-ID: <BANLkTineh8ZO9o1tqX36W=2QJz=1tYMhAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

In former versions of buildroot there was stunnel package (version
1.16 as I remember). Are there any issues with it? I am trying to
import stunnel 1.22 and 1.29 (from Debian) but without any success.
First problem is connect() call for client tunnel: it returns error
but errno=0. Does uclibc support errno for socket calls?
If I check additionally for errno != 0 to prevent falling into error
handling branch, then I have second problem: SSL_connect() failure in
init_ssl() with "SSL_connect: Peer suddenly disconnected" error.
Tcpdump shows a pair or three packets from client to server and vice
versa.
On the Debian 5.0.0. the similar configuration works fine.
My embedded system is busybox-1.17.1, linux-2.6.35.3, uclibc-0.9.31
(as far as I remember it is buildroot-08.2010).

Have anybody encountered the similar problems?

Thanks in advance,
Sergey Naumov.
