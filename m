From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:53:28 +0200
Subject: [Buildroot] Target to create missing hashes.
In-Reply-To: <5521BE08.9020304@proximus.be>
References: <5521BE08.9020304@proximus.be>
Message-ID: <20150406105328.5976c0a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Sagaert,

On Mon, 06 Apr 2015 00:58:16 +0200, Johan Sagaert wrote:

> Would be nice to have a convenience make target to create missing hashes.
> (Comes in handy for custom packages not available in upstream buildroot, 
> or when bumping versions before
> posting the patches to the mailing list.)
> 
>   make  <pkg>-sha256_hash

Not sure, because we want to encourage people to look for hashes on the
upstream web site rather than generating them locally. Generating
hashes locally should be a last resort.

> Maybe the missing hash warnings should also be redirected to a file 
> .missing_hashes, they mostly go unnoticed otherwise while building.

There is a series from Yann that makes such warnings become hard
errors. However, we had to disable it because it was breaking custom
external toolchain. Another series from Yann is fixing this, but is
pending review. But clearly, this is where we want to go.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
