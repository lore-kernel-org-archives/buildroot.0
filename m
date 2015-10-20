From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 16:32:54 +0200
Subject: [Buildroot] [PATCH] tstools: GitHub migration
In-Reply-To: <1445346374-21146-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 20 Oct 2015 14:06:14 +0100")
References: <1445346374-21146-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87y4exip9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > tstools has migrated to GitHub, so let's use this opportuninty to rework
 > this package as well.

 > - Change site to GitHub.
 > - No releases of tags yet, so let's use the latest commit ID from the
 >   master branch as a version.
 > - There is currently no license attributed to tstools, so state that in
 >   the tstools.mk file and add empty license variables. This issue is
 >   being tracked upstream: https://github.com/kynesim/tstools/issues/32
 > - Wrap the help text in the Config.in to 72 characters, and also change
 >   the project URL to the GitHub one.
 > - Add a hash file.
 > - Rename the patch to use a four digit numbering (001 -> 0001).

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

> +++ b/package/tstools/tstools.mk
 > @@ -4,10 +4,13 @@
 >  #
 >  ################################################################################
 
 > -TSTOOLS_VERSION = 1_11
 > -TSTOOLS_SITE = https://tstools.googlecode.com/files
 > -TSTOOLS_SOURCE = tstools-$(TSTOOLS_VERSION).tgz
 > -TSTOOLS_LICENSE = MPL v1.1
 > +# No releases or tags yet. Use the latest commit ID from master branch.
 > +TSTOOLS_VERSION = 08f6be304040e7b84760ac3920bcff4a563b6cd2
 > +TSTOOLS_SITE = $(call github,kynesim,tstools,$(TSTOOLS_VERSION))
 > +# tstools doesn't have any license so far. See:
 > +# https://github.com/kynesim/tstools/issues/32
 > +TSTOOLS_LICENSE =
 > +TSTOOLS_LICENSE_FILES =

While it is correct that the upstream repo doesn't include a copy of the
license file, plenty (all?) source files clearly list that they are
under the MPL v1.1 license:

grep -rls 'MPL v1.1'
tsplay_fns.h
ipv4.h
pcap.h
psdots.c
ipv4.c
ts_fns.h
reverse.c
compat.h
m2ts2ts.c
avs_fns.h
fmtx.c
pes_fns.h
fmtx.h
ts2es.c
nalunit.c
tswrite_defns.h
python/Setup.py
python/Makefile
python/tstools/cwrapper.pxd
python/tstools/tstools.pyx
python/tstools/__init__.py
python/tstools/common.pxd
nalunit_fns.h
es_defns.h
bitdata.c
ethernet.c
reverse_defns.h
adts.c
accessunit_fns.h
test_printing.c
ts.c
adts_defns.h
esreverse.c
esdots.c
sockread.py
esreport.c
test_pes.c
tsplay.c
ps2ts.c
stream_type.c
filter_fns.h
Makefile.w32
bitdata_fns.h
misc_defns.h
printing.c
pidint_fns.h
rtp2264.c
avs_defns.h
ts_defns.h
es_fns.h
bitdata_defns.h
ethernet.h
ps_fns.h
ps.c
accessunit.c
audio.c
misc_fns.h
h222_defns.h
test_es_unit_list.c
pes_defns.h
socktest.py
Makefile
pes.c
yuv2/src/com/aminocom/yuv2/MainFrame.java
yuv2/src/com/aminocom/yuv2/Prefs.java
yuv2/src/com/aminocom/yuv2/AboutBox.java
yuv2/src/com/aminocom/yuv2/YUV2.java
yuv2/src/com/aminocom/yuv2/FormatDialog.java
yuv2/src/com/aminocom/yuv2/Utils.java
yuv2/src/com/aminocom/yuv2/BufferedImage.java
yuv2/src/com/aminocom/yuv2/LogWindow.java
yuv2/src/com/aminocom/yuv2/ImageCanvas.java
tsserve.c
docs/ac3.txt
docs/adts.txt
docs/get_next_access_unit.py
docs/todo.txt
docs/build_html.py
docs/library.txt
docs/index.txt
docs/tools.txt
docs/get_next_access_unit.py.html
h222.c
h262_fns.h
tsreport.c
nalunit_defns.h
tswrite_fns.h
audio_defns.h
tsinfo.c
ps_defns.h
printing_defns.h
pidint.c
audio_fns.h
tsfilter.c
filter_defns.h
psreport.c
version.h
pcap.c
ac3.c
pcapreport.c
ts_packet_insert.c
reverse_fns.h
ac3_fns.h
avs.c
h262.c
ts2ps.c
tsplay_innards.c
l2audio_fns.h
adts_fns.h
es2ts.c
video_defns.h
h262_defns.h
misc.c
esfilter.c
accessunit_defns.h
h222_fns.h
esmerge.c
pidint_defns.h
tsdvbsub.c
filter.c
tsplay_defns.h
es.c
printing_fns.h
test_nal_unit_list.c
tswrite.c
l2audio.c

So I've kept the license as MPLv1.1 and adjusted the comment to make it
clear that it is just the license file we are missing.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
