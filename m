From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Feb 2012 23:59:40 +0100
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
	instead of -P to set output file
In-Reply-To: <CA+appbOf=yN3pWw_HC12BL3sy=SUbMK2CE7pa6MeaQMvLwO6fg@mail.gmail.com>
References: <20120214115140.4C70390A99@busybox.osuosl.org>
 <87k43pv0mi.fsf@macbook.be.48ers.dk>
 <CA+appbOf=yN3pWw_HC12BL3sy=SUbMK2CE7pa6MeaQMvLwO6fg@mail.gmail.com>
Message-ID: <201202142359.40902.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 14 February 2012 18:54:22 Spenser Gilliland wrote:
> After greping through the source the enormity of that patch and the
> potential for out of tree breakage suggest a different course of
> action.  A possible solution may be to scan the SITE var for a
> question mark and only change to non-slash mode on that occasion.
> Would this be reasonable?

 Yeah, my patch was too easy :-)

 I think it's better to keep the split at the /

 We could use either
microblaze_v2.0.git;a=blob;f=microblaze-unknown-linux-gnu.tgz
or
?p=xldk/microblaze_v2.0.git;a=blob;f=microblaze-unknown-linux-gnu.tgz
as the _SOURCE.  Of course, that still requires some serious massaging
to avoid funky filenames that break everything.  So probably not an
option either.

 I think on the short term it is probably best to use a work-around
like for the blackfin toolchain: a non-standard download target, that
doesn't use the DOWNLOAD function but a custom $(WGET) call.

 On the longer term we could try to refactor that into the generic
DOWNLOAD function.

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
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120214/dc64ecd5/attachment-0001.html>
