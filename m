From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 1 Jan 2009 13:36:21 +1100
Subject: [Buildroot] shell issues when /bin/sh is 'dash' instead
	of	'bash'
In-Reply-To: <bbbeeccd0812311504p2e7f96a6l923c938acac8acf0@mail.gmail.com>
References: <bbbeeccd0812311504p2e7f96a6l923c938acac8acf0@mail.gmail.com>
Message-ID: <20090101023620.GA13399@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 31, 2008 at 04:04:37PM -0700, Wade Berrier wrote:
> The result is that some files don't get installed into the target
> system when /bin/sh points to dash (like on recent ubuntu and debian?
> distros)
> 
> Attached is a patch to use CONFIG_SHELL.

Why aren't we setting SHELL=$(CONFIG_SHELL) somewhere, rather than using
$(CONFIG_SHELL) explicitly in each place? (And why do I have the feeling
we've had this discussion before?)

> Question: is this the best way to fix this?  Or maybe these packages
> should be fixed more in the style of how Jacmet fixed grep? (see
> http://sources.uclibc.org/index.py/trunk/buildroot/package/grep/grep.mk?r1=22930&r2=22931
> )

dash(1) on my system says -ot is supported anyway. If not perhaps it can
be expressed in a better way; I think that would be better than this
fix.

Besides is CONFIG_SHELL guaranteed to be bash anyway?



Happy new year.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
