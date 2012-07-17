From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jul 2012 12:47:26 +0200
Subject: [Buildroot] [PATCH v2] libplayer: fix handling of cflags in
	configure
In-Reply-To: <20120715215100.7e280618@skate>
References: <1342301676-23857-1-git-send-email-arnout@mind.be>
 <20120715215100.7e280618@skate>
Message-ID: <500542BE.40504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/12 21:51, Thomas Petazzoni wrote:
> Le Sat, 14 Jul 2012 23:34:36 +0200,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
>> Problem was found when compiling libplayer with GStreamer support
>> on x86_64 with a Sourcery toolchain.
>
> I've tried to build libplayer with gstreamer support for x86_64 with a
> Sourcery toolchain, and I didn't had an issue. Since your problem was
> quoting related, I thought that it could be caused by the ccache
> support, but it isn't.
>
> Can you post the .config that triggers the problem, or provide more
> details on the problem? It's not that I don't believe that there is a
> problem, but without producing it, I feel a bit out of infos to review
> the patch.

  The config is an allpackageyesconfig from which I removed a few packages
that don't work on x86_64 or that can't be downloaded anymore.  I've attached
the defconfig.  You'd best interrupt the build after the cross-compiler is
extracted and then run 'make libplayer' explicitly, or you'll have to wait
for hours for the build to finish...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120717/e7bb9b87/attachment-0001.ksh>
