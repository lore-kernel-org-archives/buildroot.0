From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 21:54:09 +0000 (UTC)
Subject: [Buildroot] [Bug 8491] libglib2 2.46.1 not Building for armv5 on
	2015.11-rc3
In-Reply-To: <bug-8491-163@https.bugs.busybox.net/>
References: <bug-8491-163@https.bugs.busybox.net/>
Message-ID: <20151129215409.DCA068198D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8491

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> 2015-11-29 21:54:09 UTC ---
(In reply to comment #0)
> When configure runs..
> configure: WARNING: unrecognized options: --disable-doc, --disable-docs,
> --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6
> 
> when building..
>   CC       libglib_2_0_la-gthread.lo
> /tmp/.private/root/ccSdfBdl.s: Assembler messages:
> /tmp/.private/root/ccSdfBdl.s:1010: Error: shifts in CMP/MOV instructions are
> only supported in unified syntax -- `mov r12,r12,ror#3'
> /tmp/.private/root/ccSdfBdl.s:1010: Error: shifts in CMP/MOV instructions are
> only supported in unified syntax -- `mov r12,r12,ror#13'
> /tmp/.private/root/ccSdfBdl.s:1011: Error: shifts in CMP/MOV instructions are
> only supported in unified syntax -- `mov r12,r12,ror#29'
> /tmp/.private/root/ccSdfBdl.s:1011: Error: shifts in CMP/MOV instructions are
> only supported in unified syntax -- `mov r12,r12,ror#19'
> /tmp/.private/root/ccSdfBdl.s:1012: Error: lo register required -- `orr

That TMPDIR seems to indicate that you are building as root. PLEASE don't do
that. One of the most basic features of Buildroot is that you don't need to be
root (and no guarantees are given that it will behave sanely if you DO run it
as root).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
