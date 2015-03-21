From: Steve Kenton <skenton@ou.edu>
Date: Sat, 21 Mar 2015 14:17:51 -0500
Subject: [Buildroot] [PATCH v4 1/1] tovid: new package
In-Reply-To: <20150320231342.41bc216c@free-electrons.com>
References: <1426701612-14785-1-git-send-email-skenton@ou.edu>
 <20150320231342.41bc216c@free-electrons.com>
Message-ID: <550DC3DF.50900@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/2015 05:13 PM, Thomas Petazzoni wrote:

> 
> Can you test if tovid effectively works with Python 3 ?
It's stated specifically in the change log for version 0.35

Steve

Version history / Release notes / Changelog:
tovid 0.35

See the full changelogs http://tovid.wikia.com/wiki/Tovid_changelog

Highlights:

Support for avconv from libav.org (FFmpeg fork).
Removed mencoder dependency, and transcode is now optional, as ffmpeg will be used instead for seeking.
Added Python 3 support (support for python 2.4/2.5 dropped from titleset-wizard).
Add -encode-only option so that the tovid gui can also be used as an encoding only GUI. This allows 'batch' encoding by selecting multiple files.
Fix for ffmpeg bug (some versions) when generating silence from /dev/zero.
GUI now supports vertical resolution of 600 pixels (some laptops/netbooks)
movied libcairo stuff to its own branch so it is no longer a suggested dependancy.
GUI no longer chokes on loading some problematic options - it will ignore them and popup a copyable message showing the options in question.
GUI and titleset-wizard positions now synced so the GUI loads in place of the wizard and vice versa.
More consistent menu title and video titles style behavior.
Added *-font-deco (-title-font-deco and -titles-font-deco), to support all former "makemenu" options.
Cleanup of alignment of text and images, so there are fewer surprises.
Decreased verbosity of screen output.
Fix for broken showcase image display when doing -static faded menus.
Updated -quick-menu so it works with recent ffmpeg versions.
Fix for recent ffmpeg not parsing 'ffmpeg -h' fully. (caused bug in -loop 0 vs. -loop_input for slideshows)
Many other bug fixes and updates for changed backend options (notably ffmpeg).
