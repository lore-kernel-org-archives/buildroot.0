From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 21 Jul 2015 22:42:14 +0100
Subject: [Buildroot] Packages hosted on SourceForge
Message-ID: <CA+BsyQ7yogCrmc9aNitEYKfzjegz+9cqH=sXDRkqBeeM=n9NnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I spent a few hours walking down all of the packages (~200 in all, out of
~1630 total) hosted on a sourceforge download site which could be fetched
from a more authoritative download location.

It turns out to be rather slim pickings; the vast majority of
these packages are hosted principally on sourceforge with no
alternative download location. Quite a few use github for hosting
the repositories, but still use sourceforge to host the official
releases. In one or two cases the project websites had a more
authoritative download location, but requested that the sourceforge site be
used due to its superior global reach and load capacity.

The simple candidates for having their upstream URL updated are as follows.
In some cases we'll need to rework the version number variables slightly.

=========================

arptables
old :
http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
new : ftp://ftp.netfilter.org/pub/arptables/

ebtables
old :
http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst
.,-,$(EBTABLES_VERSION))
new : ftp://ftp.netfilter.org/pub/ebtables/

freetype
old :
http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
new : http://download.savannah.gnu.org/releases/freetype/

iperf
old : http://downloads.sourceforge.net/project/iperf
new : https://iperf.fr/download/iperf_$(IPERF_VERSION)/

logsurfer
old :
http://downloads.sourceforge.net/project/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
new : http://www.crypt.gen.nz/logsurfer/logsurfer-1.8.tar.gz

msgpack
old : http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
new :
https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)/

mutt
old : http://downloads.sourceforge.net/project/mutt/mutt
new : ftp://ftp.mutt.org/mutt

poco
old :
http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
new : http://pocoproject.org/releases/poco-$(POCO_VERSION_MAJOR)/

wine -
old : http://downloads.sourceforge.net/project/wine/Source/
new: http://ftp.winehq.org/pub/wine/source/$(WINE_VERSION)/

zlib
old : http://downloads.sourceforge.net/project/libpng/zlib/$(ZLIB_VERSION)
new : http://zlib.net/

=========================

I will prepare a patch to fix the above.

Some packages appear at first glance to have authoritative releases hosted
outside of sourceforge, but closer examination suggests that we should not
update these yet.

procps_ng - project moved to gitlab, however no downloads appear to
be hosted there
old : http://downloads.sourceforge.net/project/procps-ng/Production
new :

tcl - project website provides local FTP link, but appears to
prefer sourceforge.
old : http://downloads.sourceforge.net/project/
new :

tcllib - canonical download site requires a login. Sourceforge is being
maintained.
old :
http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
new :

openjpeg -migrated to github, but the new 1.5.2 archive does not match the
old one - files are missing.
old :
http://downloads.sourceforge.net/project/openjpeg.mirror/$(OPENJPEG_VERSION)
new :

libmad - don't fix. Site appears to move older versions into an "archive"
directory which could cause buildroot builds to fail later.
old : http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
new : ftp://ftp.mars.org/pub/mpeg/

madplay - don't fix. Site appears to move older versions into an "archive"
directory which could cause buildroot builds to fail later.
old :
http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
new : ftp://ftp.mars.org/pub/mpeg/

=========================
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150721/2c55055f/attachment-0001.html>
