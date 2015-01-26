From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:35:41 +0100
Subject: [Buildroot] [PATCH] loosen threads dependency for nftables
In-Reply-To: <20150118142320.GR27361@marmot>
References: <20150118142320.GR27361@marmot>
Message-ID: <20150126233541.3b7877af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Clouter,

On Sun, 18 Jan 2015 14:23:20 +0000, Alexander Clouter wrote:
> nftables works fine without threads, only the XML parsing support requires
> -lpthreads so move the depends into BR2_PACKAGE_LIBNFTNL_XML.
> 
> Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>

Thanks, applied, after slightly tweaking the commit title/log. A commit
title on a package should have the following form:

	<package>: <description>

And in your case, it's actually the libnftl package that gets its
thread dependency changed. nftables is only affected as a side-effect.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
