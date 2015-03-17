From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 20:59:23 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <trinity-557da2b4-73c3-45a5-ad2a-8d47aa198916-1426621923742@3capp-gmx-bs26>
References: <trinity-557da2b4-73c3-45a5-ad2a-8d47aa198916-1426621923742@3capp-gmx-bs26>
Message-ID: <20150317205923.437f4a42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 17 Mar 2015 20:52:03 +0100, Peter Seiderer wrote:

> Will provide a patch for postgresql to check for fork/BR2_USE_MMU, is there any special string
> for the comment besides 'needs threads'?

No there is no comment about a BR2_USE_MMU dependency, because it's not
something the user can "fix" : if your architecture doesn't have a MMU,
it's like this, there's nothing you can do about it.

> No special point, had the build environment still from [1] around...
> 
> In retrospect (in case bfin is disabled because of fork) the patch subject should
> have been something different...

Well, the patch by itself is then completely useless, because Blackfin
is a noMMU architecture, so postgresql will never work on it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
