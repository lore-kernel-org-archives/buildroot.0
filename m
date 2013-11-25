From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Mon, 25 Nov 2013 14:19:38 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <20131121164242.64981c00@skate>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>	<1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate>
Message-ID: <52934E6A.9040204@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 11/21/2013 04:42 PM, Thomas Petazzoni wrote:
> Is the dependency on OpenSSL or GnuTLS always needed? Or is it only
> needed if you enable SFTP or some specific protocol?

It's a compile-time dependency, since lftp doesn't permit to select what 
component should be built.

About the run-time, I'm not sure, but I checked a little bit the lftp 
modules.
There are two libraries, liblftp-network.so and liblftp-pty.so, that are 
needed for lftp. Both these libraries seems to need a crypto library.

readelf -d liblftp-network.so | grep Shared
  0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
  0x00000001 (NEEDED)                     Shared library: 
[libcrypto.so.1.0.0]
  0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
  0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
  0x00000001 (NEEDED)                     Shared library: [libstdc++.so.6]
  0x00000001 (NEEDED)                     Shared library: [libm.so.0]
  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
  0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
/
/From my point of view, it means that we can't get rid of OpenSSL or GnuTLS.


Best regards,
Arnaud

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131125/e9b7e2eb/attachment.html>
