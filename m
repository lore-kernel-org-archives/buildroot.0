From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 08:57:05 +0100
Subject: [Buildroot] [PATCH] cryptsetup: remove hard dependency on
 libgcrypt
In-Reply-To: <54D27FAC.4050004@je-eigen-domein.nl>
References: <1423074809-602-1-git-send-email-bos@je-eigen-domein.nl>
 <20150204205643.036b3e61@free-electrons.com>
 <54D27FAC.4050004@je-eigen-domein.nl>
Message-ID: <20150205085705.5edbc489@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Wed, 04 Feb 2015 21:23:08 +0100, Floris Bos wrote:

> On 02/04/2015 08:56 PM, Thomas Petazzoni wrote:
> > On Wed,  4 Feb 2015 19:33:28 +0100, Floris Bos wrote:
> >
> >> - Removes CRYPTSETUP_AUTORECONF as it is redundant, and reconf does
> >> create a dependency on libgcrypt for the m4 macros used.
> > This essentially reverts commit
> > d66c981aaa2248b7e20a4f802f3643435a1761ca, which was made to fix
> > http://autobuild.buildroot.net/results/9ca/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/.
> 
> d66c981aaa2248b7e20a4f802f3643435a1761ca was already reverted by commit 
> 40c341da78f3315fa31e4ea56b470753bf915a31 which bumped version again and 
> removed cryptsetup-0001-link-against-lrt-for-clock_gettime.patch that 
> modified configure.ac
> 
> Looks to me that removing the autoreconf was simply overlooked there.

Ah, indeed! Would have been good to mention in the commit log, then.

> > Can you rebuild the same configuration and see if with your patch it
> > builds fine?
> 
> That configuration does not work with today's buildroot due to unrelated 
> reasons.
> Invalid lua package selection combination, and a long list of legacy 
> options.

Yes, obviously old configurations may need some tweaking to build, to
remove legacy options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
