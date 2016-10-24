From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Oct 2016 14:02:51 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <c2da1832-3282-33f0-1588-e828f3df4801@mind.be> (Arnout
 Vandecappelle's message of "Thu, 20 Oct 2016 18:39:37 +0200")
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
Message-ID: <874m42lztg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> * TARGET_CFLAGS = $(TARGET_WRAPPER_CFLAGS) $(TARGET_OPTIMIZATION) \
 >> $(TARGET_DEBUGGING)
 >> TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 >> TARGET_LDFLAGS = $(TARGET_CFLAGS)
 >> TARGET_FCFLAGS = $(TARGET_CFLAGS)

 >  Turns out that it will be slightly more complicated than this. For MIPS, the
 > -mmsa option to enable SIMD processing MUST NOT be used in kernel and bootloader
 > builds. Therefore we cannot add it to TARGET_WRAPPER_CFLAGS. Instead, we'll have
 > a TARGET_EXTRA_CFLAGS that does not get added to the wrapper but does get added
 > to TARGET_CFLAGS and therefore passed to package buidls.

If that is the only problem, couldn't we just add -mno-msa to the
kernel/bootloader if _MIPS_MSA is enabled?

-- 
Bye, Peter Korsgaard
