From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 09:48:41 +0200
Subject: [Buildroot] [PATCH-2018.02.x] util-linux: add two upstream
 patches to fix blocking on getrandom() with recent kernels
In-Reply-To: <1571905527.184522.1527477837171.JavaMail.zimbra@datacom.com.br>
 (Carlos Santos's message of "Mon, 28 May 2018 00:23:57 -0300 (BRT)")
References: <20180527103949.25839-1-peter@korsgaard.com>
 <1571905527.184522.1527477837171.JavaMail.zimbra@datacom.com.br>
Message-ID: <8736ycmd9i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

Hi,

 >> This change unfortunately causes users of libuuid from util-linux to block
 >> for a very long time waiting for sufficient entropy.  An example of this is
 >> mke2fs, which uses libuuid to generate the filesystem UUID.
 >> 
 >> Fix this by backporting two post-2.31 fixes from upstream.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Tested-by: Carlos Santos <casantos@datacom.com.br>

 > Built host and target util-linux for x86_64 systems running Linux
 > kernel 4.16.11 (Fedora 28) and 4.14.39 (Buildroot), respectively.

 > Ran mke2fs from an early init script to check that it did not block.

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
