From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 23:26:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix patch to
 address musl builds
In-Reply-To: <20200815233021.3a0cfb4b@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 15 Aug 2020 23:30:21 +0200")
References: <20200430194421.5530-1-vfazio@xes-inc.com>
 <20200815233021.3a0cfb4b@windsurf.home>
Message-ID: <87bliulax8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 30 Apr 2020 14:44:21 -0500
 > Vincent Fazio <vfazio@xes-inc.com> wrote:

 >> From: Vincent Fazio <vfazio@gmail.com>
 >> 
 >> Previously, __WORDSIZE was being used to define RADIX_BITS.
 >> 
 >> __WORDSIZE is not defined consistently via limits.h across all libc
 >> variants, so use LONG_BIT instead.
 >> 
 >> Fixes:
 >> 
 >> http://autobuild.buildroot.net/results/b5cb347a98dc64f77982633c0fc48d14030aa5b6/
 >> 
 >> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 >> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
 >> ---
 >> ...TS.patch => 0001-Use-LONG_BIT-to-define-RADIX_BITS.patch} | 5 +++--
 >> 1 file changed, 3 insertions(+), 2 deletions(-)
 >> rename package/ibm-sw-tpm2/{0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch => 0001-Use-LONG_BIT-to-define-RADIX_BITS.patch} (91%)

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
