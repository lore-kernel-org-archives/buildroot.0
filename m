From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Oct 2012 20:53:13 +0200
Subject: [Buildroot] [PATCH 1/2] libv4l: properly error out when one of
	the make step fails
In-Reply-To: <1350238701-30441-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Oct 2012 20:18:20 +0200")
References: <1350238701-30441-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87626czy06.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In libv4l.mk, if there are multiple elements in $(LIBV4L_DIRS_y), they
 Thomas> are built in order, one after the other. However, our loop construct
 Thomas> doesn't take into account the fact that we should error out if one of
 Thomas> the steps failed.

 Thomas> A good illustration is having BR2_PACKAGE_LIBV4L_DECODE_TM6000 and
 Thomas> BR2_PACKAGE_LIBV4L_V4L2_CTL enabled. The build of decode-tm6000 will
 Thomas> fail, but the build will happily continue without stopping in libv4l.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
