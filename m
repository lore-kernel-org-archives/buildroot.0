From: Michael Drake <michael.drake@codethink.co.uk>
Date: Fri, 18 Oct 2019 16:18:13 +0100
Subject: [Buildroot] [RFC PATCH v2 10/30] package/compiler-rt: new
 package
In-Reply-To: <df2b11e7-20e0-63a0-2964-db8ad9e8204f@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-11-michael.drake@codethink.co.uk>
 <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
 <df2b11e7-20e0-63a0-2964-db8ad9e8204f@codethink.co.uk>
Message-ID: <5ba8b53e-6327-939b-6a54-e08c13ad442c@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On 18/10/2019 09:51, Michael Drake wrote:
> On 17/10/2019 20:17, Matthew Weber wrote:

>> FYI, I plan to publish (soon) a cleaned up version of my original
>> series which add the compiler-rt feature.  That refreshed patchset
>> would have the feedback from my last series that's missing here.
> 
> Ooh, that's really interesting.  At this very moment I am actually
> working on adding a host-compiler-rt.  Currently I'm disabling
> CFI[1] in the CEF/Chromium build with `is_cfi=false`.
> 
> When I enable that feature, I get clang errors like:
> 
> clang++: error: no such file or directory:
>   '/home/tlsa/buildroot/output/host/lib/clang/8.0.0/share/cfi_blacklist.txt'

I tracked this down, btw.  The attached patch fixes it.

Basically, we create links for all the libclang_rt.* stuff
for host-clang, but they use some data files in the share
directory too, that weren't getting copied.

Cheers,

Michael
-------------- next part --------------
A non-text attachment was scrubbed...
Name: cfi-fix.diff
Type: text/x-patch
Size: 1928 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191018/fa4cb02c/attachment.bin>
