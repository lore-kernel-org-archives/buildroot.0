From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 24 Feb 2011 11:55:41 +0100
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <20110224095445.GB5481@jasper.tkos.co.il>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
	<20110224095445.GB5481@jasper.tkos.co.il>
Message-ID: <201102241155.41180.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Do you have /etc/securetty? What is its content? It should contain a
> 'ttyUL0' line to allow login.

Yes, it's there.

I just noticed that I'd forgotten to compile RPC in buildroot, which would 
explain why there's nothing in /tmp on my NFS filesystem, but I did a make 
clean; make, reinstall the filesystem and there's no difference, I still can't 
login.

I put an 'echo' in rcS and it's not being executed.
But if i put some 
ttyUL0::sysinit:/bin/echo AAAAAAAAAAAAAAAAAA
in inittab, I see them.

Any other idea ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
