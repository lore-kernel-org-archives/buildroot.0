From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Feb 2016 15:44:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
	argument to TARGET_LD for MIPS
In-Reply-To: <56C5D32E.1090002@imgtec.com> (Vicente Olivert Riera's message of
 "Thu, 18 Feb 2016 14:20:30 +0000")
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160217221313.439547e4@free-electrons.com>
 <56C4F70A.8060506@mind.be>
 <20160218090740.74a227b0@free-electrons.com>
 <87si0qwetv.fsf@dell.be.48ers.dk> <56C5D32E.1090002@imgtec.com>
Message-ID: <877fi2w01l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Hello Peter, Thomas and Arnout,
 > so, do you prefer a patch to just fix perf?

 > The perf Makefile doesn't read an environmental LDFLAGS variable, so
 > adding -EL/-EB to LDFLAGS will not work.

 > Also, doing LD="$(TARGET_CC)" in order to use gcc for linking doesn't
 > work either and it fails with errors about '-lgcc_s' not found.

 > Are you ok with doing LD="$(TARGET_LD) -EL/-EB" only when building perf
 > for MIPS architecture?

Yes, for 2016.02 I think this is fine.

-- 
Venlig hilsen,
Peter Korsgaard 
