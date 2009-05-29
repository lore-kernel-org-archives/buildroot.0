From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Fri, 29 May 2009 14:02:16 +0200
Subject: [Buildroot] Building only toolchain
In-Reply-To: <87k5405p4c.fsf@macbook.be.48ers.dk>
References: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
	<87k5405p4c.fsf@macbook.be.48ers.dk>
Message-ID: <330EC2471BF24E48B513AF1A6975EB699D059D@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
> No problem, as long as you don't move the toolchain around. We often
> build pure toolchains with STAGING_DIR set to something like
> /opt/cross/${DATE}, which can then simply be added to the path and
> used.
That helped. I set the staging dir to point somewhere else. Then I
needed to disable ccache since it stored the buildroot directory
somewhere and if I removed the buildroot the compiler wouldn't work. But
now, with ccache disabled, it works just fine even if the buildroot is
removed. 

Thanks!

-Teemu
