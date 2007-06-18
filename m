From: Johan Thelin <e8johan@gmail.com>
Date: Mon, 18 Jun 2007 10:53:55 +0200
Subject: [Buildroot] nios2 and TLS
Message-ID: <d1f7544e0706180153v28b69cc6w268bf5ccd3230120@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've been spending some time now trying to use buildroot to build a
working toolchain and root for nios2. My requirements include C++
support and threading support.

My problem is that I keep getting stuck on the TLS stuff. The error
message goes something like:

  In file included from ./include/errno.h:62,
                 from libm/k_standard.c:19:
  ./include/bits/uClibc_errno.h:14:18: tls.h: No such file or directory

Removing the need for TLS in the libm only means postponing the error
messages from hell to the libpthread build. As I understand it, this
is inevitable as TLS handles the thread-local storage of variables.

After having studied mailing archived and googled around I've found
two traces of hope:

  #1 The "TLS stuff" seems to be optional. Is it possible to build a
toolchain supporting C++ and threading without it?

  #2 Finding the mystery patch that solves this. I see hints of
Microtronix having a solution that can be found. I just don't know
where to look.


Best regards,

Johan Thelin
