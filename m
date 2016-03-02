From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 09:13:49 +0100
Subject: [Buildroot] [PATCH] package/cups: fix static linking with GnuTLS
In-Reply-To: <56D61DC3.8090502@mind.be>
References: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
 <20160228230022.3d8805d6@free-electrons.com>
 <56D61DC3.8090502@mind.be>
Message-ID: <20160302091349.3b195481@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 1 Mar 2016 23:54:59 +0100, Arnout Vandecappelle wrote:

>  Well, inside a package, it's the responsibility of the package build system to
> link with all required libraries (in the required order). That can either be
> handled by a helper like libtool, or the Makefile should handle it manually.
> 
>  In other words: I beliver Joerg's fix is the correct one.

As I said in my reply: the issue with Joerg fix is that in the dynamic
linking case, it creates useless additional NEEDED entries in the
binaries, which are not needed since those binaries are already linked
with libcups.so, which itself is linked with libgnutls.so.

Now whether it strongly matters can be discussed, but it is for sure
not very elegant.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
