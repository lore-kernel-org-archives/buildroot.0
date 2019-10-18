From: Michael Drake <michael.drake@codethink.co.uk>
Date: Fri, 18 Oct 2019 09:51:25 +0100
Subject: [Buildroot] [RFC PATCH v2 10/30] package/compiler-rt: new
 package
In-Reply-To: <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-11-michael.drake@codethink.co.uk>
 <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
Message-ID: <df2b11e7-20e0-63a0-2964-db8ad9e8204f@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On 17/10/2019 20:17, Matthew Weber wrote:
> On Thu, Oct 17, 2019 at 10:30 AM Michael Drake
> <michael.drake@codethink.co.uk> wrote:
>>
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> This patch adds support for the compiler-rt (CLANG runtime) library.
>> It builds a set of static libraries and installs them into the
>> CLANG/LLVM toolchain resource folder.
>>
> 
> FYI, I plan to publish (soon) a cleaned up version of my original
> series which add the compiler-rt feature.  That refreshed patchset
> would have the feedback from my last series that's missing here.

Ooh, that's really interesting.  At this very moment I am actually
working on adding a host-compiler-rt.  Currently I'm disabling
CFI[1] in the CEF/Chromium build with `is_cfi=false`.

When I enable that feature, I get clang errors like:

clang++: error: no such file or directory:

'/home/tlsa/buildroot/output/host/lib/clang/8.0.0/share/cfi_blacklist.txt'

And I believe the missing cfi_blacklist.txt should come with
compiler-rt.

I'll have a look for the feedback from the last series.

Thanks very much for the pointer for and the original patch!

[1] http://clang.llvm.org/docs/ControlFlowIntegrity.html

Best regards,

Michael
