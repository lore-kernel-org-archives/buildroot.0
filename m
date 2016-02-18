From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Feb 2016 10:25:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
	argument to TARGET_LD for MIPS
In-Reply-To: <20160218090740.74a227b0@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 18 Feb 2016 09:07:40 +0100")
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160217221313.439547e4@free-electrons.com>
 <56C4F70A.8060506@mind.be>
 <20160218090740.74a227b0@free-electrons.com>
Message-ID: <87si0qwetv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Unless Vicente volunteers to work on an ld wrapper, I guess on the short term
 >> we should take patches like these. That said, it should really be passed through
 >> LDFLAGS and not LD itself.

 > And the hack be limited to those specific packages that are broken,
 > IMO. At least until we realize how many packages are affected by this.
 > It would be annoying to put those additional flags globally just to fix
 > one single package.

As I understood it from Vicente on IRC:

- The endian flags are always required when linking
- The options are understood both when linking with gcc and ld

Which is why I suggested we do it globally.

-- 
Bye, Peter Korsgaard
