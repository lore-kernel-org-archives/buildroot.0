From: Endejan, Edward <Edward.Endejan@dmh-global.com>
Date: Thu, 2 Feb 2012 18:38:25 -0800
Subject: [Buildroot] install-to-staging OK but install-to-target fails
In-Reply-To: <87d39x7z1k.fsf@macbook.be.48ers.dk>
References: <D921DC3114DE02419F1BFD413E98678E102B2859C8@VA3DIAXVS331.RED001.local>,
 <87d39x7z1k.fsf@macbook.be.48ers.dk>
Message-ID: <D921DC3114DE02419F1BFD413E98678E102B05F49F@VA3DIAXVS331.RED001.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for the quick response. Our corporate internet connection went down this afternoon so we were pretty much dead in the water for the rest of the workday. Luckily we have a web interface to our cloud-hosted email so I saw your response tonight from home.

Assuming our connection is restored by tomorrow, I'll get the defconfig to you. Is doing a 'make savedefconfig' any different than just sending the .config file from the base directory of buildroot?

A couple of other details in case they are relevant ...

We were able to successfully build these GStreamer libraries with the original .mk files included with buildroot, but they were using .tar.gz snapshots rather than fetching the source using git. We want to convert to using the git approach so that we can easily push modifications to their source code back to that project.

We have cloned the GStreamer git repositories that we are using to a local git server so that we have them local and for faster, uninterrupted access. We have modified these .mk files to use git instead and to fetch from our local repository of clones. As another side-effect of this we added a pre-configure hook to run their autogen.sh script because the GStreamer project uses this approach rather than the standard buildroot autotools configuration approach. The .tar.gz snapshots include pre-built .configure files - the git clone versions do not. I'll send you the modified .mk files so that you have the whole picture, but they will have to be modified to point to the cgit.freedesktop.org git repositories before they will work for you.

If there are other methods or tips you can offer to help me debug this myself, that would be appreciated.

I thought the symptoms of this problem might sound familiar to someone on the list that could point me in the right direction.

Thanks,
Ed

P.S. A colleague of mine thought this might be related/caused by a missing --sysroot parameter somewhere on the command line. I'll ask him for more specifics and investigate that angle myself as well.

________________________________________
From: Peter Korsgaard [jacmet at gmail.com] On Behalf Of Peter Korsgaard [jacmet at uclibc.org]
Sent: Thursday, February 02, 2012 3:36 PM
To: Endejan, Edward
Cc: buildroot at busybox.net
Subject: Re: install-to-staging OK but install-to-target fails

>>>>> "Edward" == Endejan, Edward <Edward.Endejan@dmh-global.com> writes:

 Edward> Hi,
 Edward> I'm attempting to build gstreamer and gst-plugins-base from git
 Edward> repositories with buildroot, cross-compiling for ARM. The build
 Edward> and install-to-staging phases complete without error, but then
 Edward> install-to-target fails as follows:

It works here. Care to post your buildroot defconfig (run make
savedefconfig to create it).

--
Bye, Peter Korsgaard
