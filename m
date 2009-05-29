From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 May 2009 09:45:23 +0200
Subject: [Buildroot] Building only toolchain
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local> (Teemu
	Keskinarkaus's message of "Fri\, 29 May 2009 07\:25\:19 +0200")
References: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
Message-ID: <87k5405p4c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Teemu" == Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com> writes:

 Teemu> Hi,

 Teemu> Is it possible to build only toolchain in buildroot? I tried
 Teemu> to search the makefiles, but I couldn?t find a target that
 Teemu> would do it.

Sure, simply don't select and packages and no file systems, then it
will only build the toolchain.

 Teemu> It seems that there are some absolute paths stored in
 Teemu> buildroot toolchain binaries(at least ccache has) so I can?t
 Teemu> just copy them to another system. Or can the toolchain be
 Teemu> built somehow that it doesn?t store any local information
 Teemu> there?

Yes, the BR output is in general not relocatable.

 Teemu> I don?t want to build whole system, but just applications so
 Teemu> only toolchain is needed and not the whole buildroot. I also
 Teemu> like to use the same toolchain that was used in buildroot to
 Teemu> prevent any problems that might come from using different
 Teemu> toolchain.

No problem, as long as you don't move the toolchain around. We often
build pure toolchains with STAGING_DIR set to something like
/opt/cross/${DATE}, which can then simply be added to the path and
used.

-- 
Bye, Peter Korsgaard
