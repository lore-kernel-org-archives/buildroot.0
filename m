From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 00:03:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-09
In-Reply-To: <536F8C6E.1050004@mind.be>
References: <20140510063010.4D1F81010DF@stock.ovh.net>
 <536E86B1.4050005@mind.be> <20140511043405.GB4096@tarshish>
 <536F8C6E.1050004@mind.be>
Message-ID: <20140512000357.46f83677@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 11 May 2014 16:42:54 +0200, Arnout Vandecappelle wrote:

> > Your patch is correct, I guess, but as far as I understand it doesn't solve 
> > the host architecture dependency problem that is causing the host-protobuf 
> > failure above.
> 
>  True. We could add a dependency on BR2_HOSTARCH for that. Except that Kconfig
> doesn't support string comparison AFAIK. So we'd need to create bool symbols for
> all the supported host architectures...

We already use string comparison in quite a few places, especially in
toolchain/toolchain-external/Config.in:

	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
