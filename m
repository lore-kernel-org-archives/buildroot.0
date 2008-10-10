From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 10 Oct 2008 14:29:04 +1100
Subject: [Buildroot] Both cramfs + jffs2 in buildroot?
In-Reply-To: <48EDBDDD.2030206@cetrtapot.si>
References: <48ECAD04.6070209@timeterminal.se> <48EDBDDD.2030206@cetrtapot.si>
Message-ID: <20081010032903.GA19868@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 09, 2008 at 10:16:29AM +0200, Hinko Kocevar wrote:
> You'll need to look at the target/jffs2.mk and target/cramfs.mk. Maybe
> buildroot code has to be modified to allow both fs being built at once.
> Also kernel configuration must be fixed to support one more MTD
> partition. Provide your own boot scripts and implement the logic of
> mounting the jffs etc.

buildroot already allows you to enable as many different target
filesystems as you like, but they will all contain the same thing - the
root file system.

Daniel wanted to put /etc on a different file system but some people
might want to put some packages elsewhere etc.. it would be quite
complicated to build a configuration system for this.

Perhaps the hint is in the name "buildroot" ;)

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
