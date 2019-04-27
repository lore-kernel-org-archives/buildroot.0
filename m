From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Apr 2019 20:12:14 +0200
Subject: [Buildroot] qt5base-5.12.2 fails to buils with libressl
In-Reply-To: <20190425105934.1000fc52@ivan-Z97>
References: <20190425105934.1000fc52@ivan-Z97>
Message-ID: <c3d1898a-6882-4a22-2153-2d989d01d9ff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/04/2019 15:59, Ivan Nazarenko wrote:
> 
> Just to warn someone that downloads a recent buildroot from git, qt5network is not compatible with libressl:
> 
> https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=228344

 Great :-(

 I'm adding a few qt5 users in Cc for this discussion.

 So, IIUC, this is a runtime issue: the needed functions from openssl can't be
found while (dlopen()?) loading the libressl library [1].

 And upstream qt5 project explicitly says that they will not accept patches to
add libressl support [2].

 If this is really the case, then I propose to drop libressl support entirely
for QT5_LATEST. For 5.6 we do need libressl because it is in fact the only one
that works (but then the question is whether it actually *does* work, of course).

 So, I propose that the OPENSSL conditions in qt5base are changed into
LIBOPENSSL. Can someone write a patch for that?

 Regards,
 Arnout


[1] https://github.com/libressl-portable/openbsd/issues/33
[2] https://bugreports.qt.io/browse/QTBUG-68374
