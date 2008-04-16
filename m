From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 16 Apr 2008 10:36:46 +0200
Subject: [Buildroot] Can't compile NSF mounts
References: <005601c89afa$bdfe24b0$ad289e86@LPSC0173W>
	<02fb01c89ee7$5d21f680$ad289e86@LPSC0173W>
	<4804B462.3050109@bfs.de>
Message-ID: <036701c89f9d$04ba01c0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> did you try -o nolock,noatime ?
> 1. prevent locking can be an issue
> 2. noatime speeds up file access

Well, apparently I have deeper issues:
ping from the target to the host gives a 500ms avg with 50% packet loss
ping from the host to the target gives a 300ms avg with 80% packet loss
And that's over a crossover cable on 100Mbps configuration !


Digging in the archive here, I saw that some people complained recently 
about the EMAC_LITE IP and/or driver being buggy. Could this be the case ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
