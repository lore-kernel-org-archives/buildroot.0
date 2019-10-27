From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:59:21 +0100
Subject: [Buildroot] [PATCH] toolchain-external: restrict copying of
 dynamic loader to ld*.so.*
In-Reply-To: <20190205211544.26547-1-patrickdepinguin@gmail.com>
References: <20190205211544.26547-1-patrickdepinguin@gmail.com>
Message-ID: <20191027145921.3dc74718@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 22:15:44 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
> ("toolchain-external: copy ld*.so* for all C libraries") changed (among
> other things) the glob pattern to catch the dynamic loader from
>     ld*.so.*
> to
>     ld*.so*
> 
> thus now matching files like 'ld-2.20.so' in addition to files like
> 'ld.so.1'.
> 
> However, there is no apparent reason why that change was made. It is not
> explicitly mentioned in the commit message as to why that would be needed,
> nor is clear based on the rest of the changes in that commit.
> 
> The consequence of the change is that more files than needed end up in the
> target root filesystem, adding extra unnecessary size to it.
> 
> Therefore, revert the glob pattern back to what it was.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Thanks Thomas! As you know, we like this kind of patch to bitrot for a
few months in patchwork, to finally apply them.

So this is what just happened: I applied your patch, after
significantly extending the commit log with additional explanations
from your lengthy reply in this thread.

Thanks for your patience!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
