From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 11:56:41 +0100
Subject: [Buildroot] [PATCH] pkg-generic: use correct variable name for
 tar extraction exclusions
In-Reply-To: <1446622608-22556-1-git-send-email-steven@uplinklabs.net>
References: <1446622608-22556-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151104115641.5cde8953@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Tue,  3 Nov 2015 23:36:48 -0800, Steven Noonan wrote:
> The only users of this feature are in package/gcc, but they were using
> $(2)_TAR_EXCLUDES instead of pkg-generic's $(2)_EXCLUDES. The former name makes
> more sense to me and is more readable, so let's just use that.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>

Thanks for your patch. However, following your initial report, I had
already fixed the problem. Moreover, your patch was making things work
for gcc, but 1/ was breaking things for the external toolchain code
which uses <pkg>_EXCLUDES and 2/ was not updating the Buildroot manual
accordingly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
