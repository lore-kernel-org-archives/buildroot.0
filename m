From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Apr 2013 09:26:44 +0200
Subject: [Buildroot] [RFCv2] Per-package out-of-tree build
In-Reply-To: <516ECEF2.70307@mind.be>
References: <20130413205422.7eb87375@skate>
	<516ECEF2.70307@mind.be>
Message-ID: <20130418092644.19dcdf33@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 17 Apr 2013 18:33:54 +0200, Arnout Vandecappelle wrote:
> On 13/04/13 20:54, Thomas Petazzoni wrote:
> >   * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the package
> >     supports out of tree build or not. By default, it's set to NO, in
> >     which case the package source code is rsynced from its source
> >     directory to the build directory at the beginning of the configure
> >     step. It is set to YES by both the autotools and cmake package
> >     infrastructures (which have been modified to do out of tree build),
> >     and by some packages that use the generic infrastructure but
> >     nonetheless support out of tree build.
> 
>   It may have been discussed before, but wouldn't it be more convenient 
> to insert an extra rsync step explicitly? Similar to how it's currently 
> done for OVERRIDE_SRCDIR.

Yes, I think it would make sense. I'll try to implement this (I have a
11 hours flight tomorrow, so plenty of time for BR hacking, don't
hesitate to give more feedback on this out of tree stuff).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
