From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 21:28:44 +0200
Subject: [Buildroot] [PATCH] qt5jsbackend: only available on ARM, x86,
	x86-64 and mipsel
In-Reply-To: <1369772826-8019-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 22:27:06 +0200")
References: <1369772826-8019-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9nd60wj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The v8 Javascript virtual machine that is the core of qt5jsbackend is
 Thomas> only available on certain architectures. At the moment, only ARM, x86,
 Thomas> x86-64 and mipsel are supported.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/a2e/a2e62e2deaa28ec9d4d957523a00ee0b7a634950/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/qt5/qt5declarative/Config.in |    4 +++-
 Thomas>  package/qt5/qt5jsbackend/Config.in   |    7 +++++++
 Thomas>  package/qt5/qt5multimedia/Config.in  |    5 ++++-
 Thomas>  package/qt5/qt5quick1/Config.in      |    4 +++-

You seem to have forgotten qt5graphicaleffects, which also selects
qt5declarative.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
