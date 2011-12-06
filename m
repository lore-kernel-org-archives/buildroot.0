From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Dec 2011 18:07:47 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
	no suitable tar can be found
In-Reply-To: <20111123152440.0fef75ca@skate>
References: <patchbomb.1322053783@devws108>
 <d4b15640ce2d3ab89835.1322053785@devws108> <20111123152440.0fef75ca@skate>
Message-ID: <201112061807.48048.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 23 November 2011 15:24:40 Thomas Petazzoni wrote:
> > TAR is redefined to HOST_TAR, except when extracting host-tar (this
> > is a chicken-and-egg problem), so that all packages use the host-tar
> > if no suitable tar was found.
> 
> I am still puzzled by the fact that tar is needed to extract this
> host-tar, so there's like a chicken-and-egg problem. I understand that
> the real host tar is used to extract the host-tar, which is then use to
> extract all other packages. But that sounds really nasty to me.

 It's not so strange, it's like a compiler's canadian build.  You need a
compiler to compile the compiler, right?

 The way it is solved for tar is OK for me.  I think adding support for
cpio archives would just complicate things, because then host-tar
can't use GENTARGETS anymore.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111206/d726b617/attachment-0001.html>
