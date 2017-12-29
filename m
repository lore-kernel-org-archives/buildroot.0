From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 15:04:46 +0100
Subject: [Buildroot] [PATCH 1/1 v2] gcc: Add support for
 --enable-default-pie configure option.
In-Reply-To: <3ca77bc6-5613-bc51-be89-0b241fd6d204@petroprogram.com>
References: <20171228214333.8340-1-stefan.froberg@petroprogram.com>
 <20171228230743.1e6c59ab@windsurf>
 <5a5a8ab0-25f3-a3a2-bf5a-b9c7fe851c66@petroprogram.com>
 <20171229144204.00605c4e@windsurf.lan>
 <3ca77bc6-5613-bc51-be89-0b241fd6d204@petroprogram.com>
Message-ID: <20171229150446.197ea731@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:48:48 +0200, Stefan Fr?berg wrote:

> Yeah, there is no other way for external toolchains than generic flags
> passing (and possibly patching)
> or compiler wrapper (well, there is specs file but it's ...soooo messy...).

And since the different method needed for external toolchains would
also work for internal toolchains, there is no point in doing a
solution that only works for internal toolchains. See my point ?

> Personally, Im only interested of internal toolchain
> (and I think this is not the first case that internal/external
> toolchains have different rules?)

We generally try to have internal and external toolchains supported in
the same way. You may only be interested in internal toolchains, but
Buildroot as a project needs to keep the feature parity between
internal and external toolchains, so we would like to have a solution
that solves both situations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
