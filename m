From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 15:59:26 +0100
Subject: [Buildroot] [PATCH] trousers: remove inline for
 read_data/write_data
In-Reply-To: <1451082514-2730-1-git-send-email-sergio.prado@e-labworks.com>
References: <1451082514-2730-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151226155926.47a75d04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio,

On Fri, 25 Dec 2015 20:28:34 -0200, Sergio Prado wrote:
> read_data and write_data functions are declared with inline, but
> their definition is not in a .h file. This is causing errors when
> linking:
> 
> tcsps.c:(.text+0x4ac): undefined reference to `read_data'
> tcsps.c:(.text+0x1888): undefined reference to `write_data'
> ...
> 
> Patch already applied upstream.

When you give this information, please indicate which upstream commit,
and that you didn't backport the upstream commit because it was fixing
many other things at the same time. I had to look in the trousers Git
repository to find the commit you partially backported.

Also, this information should be present in the patch itself.

I've modified your patch to add such details, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
