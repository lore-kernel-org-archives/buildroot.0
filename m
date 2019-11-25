From: Tudor Holton <tudor@smartguide.com.au>
Date: Mon, 25 Nov 2019 11:15:41 +1100
Subject: [Buildroot] Question about current OpenJDK source site.
Message-ID: <3e866d3c74fcf9fce2a49518cba0830a@smartguide.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm working on upstreaming some development we've done on OpenJDK for 
Buildroot over the past few years and I'm in the process of trying to 
simplifying the diffs for submission.

I have a simple question which I'm directing towards Adam Duskett, but 
I'm open to answers for anyone who contributed to making this decision.

I understand, historically, that getting a mirrorable copy of OpenJDK 
was hard because of previous issues with Mercurial forests.  Our own 
previous versions of this package have used an intermediate Mercurial 
forest consolidation server so we can easily restart source downloads.  
However, recent developments in Buildroot makes this no longer an issue.

I'm hesitant to make a diff submission that changes OPENJDK_SITE, but I 
cannot seem to find any authoritative reference that says that source 
downloads should come from anywhere other than java.net.  The current 
release comes from github.com/AdoptOpenJDK which references 
adoptopenjdk.net.  AdoptOpenJDK.net states that they are "a community of 
Java User Group (JUG) members, Java developers and vendors" but not 
anything that is conclusive about their relationship with Oracle or 
upstream OpenJDK itself, and java.net never references them in any way.  
This makes me suspicious about the guarantees of the source.

Why does the current version of the OpenJDK package* use AdoptOpenJDK as 
the upstream source rather than the official source release at 
https://hg.openjdk.java.net/[project]/[release]/archive?

Is this just historic or is there some intended reason to use a 
downstream source?

Regards,
Tudor Holton

P.S. For clarity, I am specifically referring to packages/openjdk and 
not packages/openjdk-bin.  I understand the need to obtain binaries from 
certain sources.
