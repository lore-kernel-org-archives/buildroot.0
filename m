From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 Feb 2012 08:00:03 +0100
Subject: [Buildroot] install-to-staging OK but install-to-target fails
In-Reply-To: <D921DC3114DE02419F1BFD413E98678E102B05F49F@VA3DIAXVS331.RED001.local>
 (Edward Endejan's message of "Thu, 2 Feb 2012 18:38:25 -0800")
References: <D921DC3114DE02419F1BFD413E98678E102B2859C8@VA3DIAXVS331.RED001.local>
 <87d39x7z1k.fsf@macbook.be.48ers.dk>
 <D921DC3114DE02419F1BFD413E98678E102B05F49F@VA3DIAXVS331.RED001.local>
Message-ID: <871uqce70s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Edward" == Endejan, Edward <Edward.Endejan@dmh-global.com> writes:

Hi,


 Edward> Thanks for the quick response. Our corporate internet
 Edward> connection went down this afternoon so we were pretty much dead
 Edward> in the water for the rest of the workday. Luckily we have a web
 Edward> interface to our cloud-hosted email so I saw your response
 Edward> tonight from home.

 Edward> Assuming our connection is restored by tomorrow, I'll get the
 Edward> defconfig to you. Is doing a 'make savedefconfig' any different
 Edward> than just sending the .config file from the base directory of
 Edward> buildroot?

Great. It contains the same info, but it's easier to look at as it only
shows the options you have changed from the details.

 Edward> A couple of other details in case they are relevant ...

 Edward> We were able to successfully build these GStreamer libraries
 Edward> with the original .mk files included with buildroot, but they
 Edward> were using .tar.gz snapshots rather than fetching the source
 Edward> using git. We want to convert to using the git approach so that
 Edward> we can easily push modifications to their source code back to
 Edward> that project.

Ok.

 Edward> We have cloned the GStreamer git repositories that we are using
 Edward> to a local git server so that we have them local and for
 Edward> faster, uninterrupted access. We have modified these .mk files
 Edward> to use git instead and to fetch from our local repository of
 Edward> clones. As another side-effect of this we added a pre-configure
 Edward> hook to run their autogen.sh script because the GStreamer
 Edward> project uses this approach rather than the standard buildroot
 Edward> autotools configuration approach. The .tar.gz snapshots include
 Edward> pre-built .configure files - the git clone versions do
 Edward> not. I'll send you the modified .mk files so that you have the
 Edward> whole picture, but they will have to be modified to point to
 Edward> the cgit.freedesktop.org git repositories before they will work
 Edward> for you.

It should be enough to just add a <foo>_AUTORECONF = YES line in the
affected packages. See connman for an example. If you ./autogen.sh with
your normal host libtool then that could explain the problem (we patch
up libtool output to work around cross compile issues). Could you try a
fresh rebuild with the AUTORECONF = YES lines added.


-- 
Bye, Peter Korsgaard
