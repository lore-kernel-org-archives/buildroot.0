From: Matthew Starr <mstarr@hedonline.com>
Date: Wed, 29 Jul 2015 16:54:34 -0500
Subject: [Buildroot] Using buildroot generated toolchain as external
	toolchain issues
In-Reply-To: <20150729153034.514e8764@free-electrons.com>
References: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local><1526636.mbSdBIvjiD@sagittea><20150729090036.65757161@free-electrons.com><64CA5C49A43E314D9F7DAE05370E2F7B06771148@hed-dc01.hed.local>
 <20150729153034.514e8764@free-electrons.com>
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B0677114D@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Wednesday, July 29, 2015 8:31 AM
> 
> > Could you send out the patch for the static libraries option.    This sounds
> > like the solution that would be the least likely to cause issues if
> > updating to a future version of buildroot.
> 
> Attached.
> 
> > If the static library option is used, how would I go about deploying
> > the toolchain to the other instances of buildroot that I use?
> 
> Just tarball the toolchain (i.e, output/host/), put the tarball somewhere, and
> tell your other Buildroot instances to use it as an external toolchain.
> 

I applied the patch, built the toolchain, and pointed the other instances
of buildroot to use the toolchain tar file.  I still received the same error
as before I used the patch:

output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-gnueabihf/4.9.2/cc1: error while loading shared libraries: libcloog-isl.so.4: cannot open shared object file: No such file or directory
Incorrect ABI setting: EABIhf selected, but toolchain is incompatible
package/pkg-generic.mk:146: recipe for target 'output/build/toolchain-external-undefined/.stamp_configured' failed

The toolchain files appear to be in the output/host/opt/ext-toolchain
directory and the libcloog-isl.so.4 file is located under
output/host/opt/ext-toolchain/lib/ directory.

I also played around with the options to build the libraries as static, shared,
or both.  No matter what that setting was it made no difference.  I am
guessing this only affects the target libraries and not host.

Are there any other configuration settings I need to get the patch to work?

Best regards,
 
Matthew Starr
