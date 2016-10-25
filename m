From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 13:25:54 +0200
Subject: [Buildroot] [PATCH 0/6] xorg: fix imput drivers install paths
In-Reply-To: <cover.1477327063.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 24 Oct 2016 18:38:49 +0200")
References: <cover.1477327063.git.yann.morin.1998@free.fr>
Message-ID: <87funkllfh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > This series fixes the install paths of the few remaining input drivers
 > that incorrectly installed headers in $(TARGET_DIR)/$(STAGING_DIR).

 > The underlying issue is that xorg defines an "sdkdir" pkg-config
 > variable, as the location to find/install headers. This location is an
 > absolute path to the staging dir (aka sysroot), but headers are
 > installed in $(DESTDIR)/$(sdkdir).

 > We fix that by entirely ditching the use of sdkdir, as was done in all
 > other xorg dirvers, with the 5 first patches of the series.

Sounds sensible to me. Did you try proposing the patches upstream?

 > Additionally, to catch such situation, the 6th and last patch of the
 > series checks no such paths are present, neither in target/ nor in
 > staging/ .

This seems to overlap with the checks Samuel is adding,
E.G. TARGET_DIR/STAGING_DIR are subdirs of the host build directory, so
that check should catch these issues as well.

-- 
Bye, Peter Korsgaard
