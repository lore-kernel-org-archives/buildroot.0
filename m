From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 21:48:23 +0200
Subject: [Buildroot] [PATCH] package: fix <pkg>_DL_VERSION value
In-Reply-To: <1312486464-29590-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 4 Aug 2011 21:34:24 +0200")
References: <1312486464-29590-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8739hhnek8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> 993e51bc22f508fbaf39c5c49fd0595fc5c56013 introduced a <pkg>_DL_VERSION
 Thomas> in addition to <pkg>_VERSION. This variable, purely internal to the
 Thomas> package infrastructure, allows to store the *raw* version name, as
 Thomas> defined in the package .mk file. However, as this version string can
 Thomas> contain slashes, it is not appropriate to be part of the build
 Thomas> directory name of the package. This is why <pkg>_VERSION is defined to
 Thomas> be the same thing as <pkg>_DL_VERSION, except that slashes are
 Thomas> replaced by underscores.

Committed, thanks.

-- 
Bye, Peter Korsgaard
