From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 16:55:57 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20161116154516.w2e2wqerideqxsra@sapphire.tkos.co.il>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <b08117ad-6edc-245d-0650-0db5eb1775ce@mind.be>
 <20161115233347.107fd31d@free-electrons.com>
 <20161116154516.w2e2wqerideqxsra@sapphire.tkos.co.il>
Message-ID: <20161116165557.56fda400@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 17:45:16 +0200, Baruch Siach wrote:

> > Baruch, could you investigate whether this musl commit fixes the header
> > conflict problem for bridge-utils and norm?  
> 
> The commit log links to this musl commit and to a mailing list report[1] that 
> this fix is not enough on its own. As a result of this discussion Felix Janda 
> posted a kernel patch[2] to address the issue. See also Rich's response[3]. 
> Even if this patch is accepted, we'll most likely have to keep this 
> workaround, or an equivalent, for as long as we support kernel headers v4.9 
> and older.
> 
> [1] http://www.openwall.com/lists/musl/2016/11/09/2
> [2] http://www.openwall.com/lists/musl/2016/11/11/1
> [3] http://www.openwall.com/lists/musl/2016/11/11/2

Thanks a lot for the explanation.

So I believe we should apply your proposed workaround. However, I'm not
sure I want to take the risk of applying this to the master branch
(even though I agree it could fix some build failures). Are you OK with
applying it to the next branch?

Then, the next step (which also worries me a little bit) is:

 1. Finding the packages that we have disabled for musl because of this
    header issue, and which should now be re-enabled in musl
    configurations.

 2. Finding the packages that have patches to fix this musl-related
    issue, and remove those patches (beyond the two specific packages
    for which you already take care of this as part of your series).

I'm not sure how to proceed to identify all the affected packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
