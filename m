From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 13 Mar 2017 21:52:01 +0000
Subject: [Buildroot] [PATCH] toolchain: Disable PIE for ARC
In-Reply-To: <20170313174145.40650-1-abrodkin@synopsys.com>
References: <20170313174145.40650-1-abrodkin@synopsys.com>
Message-ID: <1489441920.3088.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2017-03-13 at 20:41 +0300, Alexey Brodkin wrote:
> Even though ARC's toolchain may build PIE binaries
> those binaries ane not really functional in runtime as of today.
> On ARC we don't expect text sections to be updated in run-time and
> so when dynamic loader attempts to patch text section we're getting
> access violation exception and application gets killed.
> 
> So until we improve support of PIE in run-time let's force-disable PIE
> in Buildroot for ARC. Oherwise autotools will continue to detect PIE and
> build OpenSSH and friends with PIE which leads to completely unexpected
> "crashes" later on on the target.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---

My memory is getting worse with time...
We specifically focused on polishing PIE support in Linux on ARC
in arc-2016.09 so please disregard this patch for a moment.

We'll take a look at the issue with OpenSSH and hopefully will
just fix it keeping PIE enabled and working for ARC.

-Alexey
