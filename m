From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 12:34:25 +0100
Subject: [Buildroot] [PATCHv2] qt: remove the
	BR2_PACKAGE_QT_JAVASCRIPTCORE option
In-Reply-To: <1383851241-28276-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Nov 2013 20:07:21 +0100")
References: <1383851241-28276-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n7kebi6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The BR2_PACKAGE_QT_JAVASCRIPTCORE option was available to force the
 > activation or disabling of the JIT compiler in the Qt Javascript
 > interpreter. However, the JIT compiler is not available for all
 > architectures, so forcing its activation does not always
 > work. Moreover, Qt knows by itself for which architectures JIT support
 > is possible, and will automatically enable it if possible.

 > Therefore, this option was in fact useless, and causing build problems
 > when enabled on architectures for which the JIT support was not
 > available. This commit removes this option and there is no
 > replacement: Qt will enable JIT at compile time when possible.

 > Fixes:

 >   http://autobuild.buildroot.org/results/aae/aaeb82753b7654eeca679ded5d0211ceebda3ea2/build-end.log
 >   http://autobuild.buildroot.org/results/367/3670e4f03ff0ce114c90bd7139243d82c427b52a/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > v1 -> v2:
 >  * As suggested by Yann, add the Config.in.legacy option even if the
 >    removal of the option should normally be transparent to the user.
 >  * Reword the commit log to provide a better description of what's
 >    happening.

Committed, thanks.

-- 
Bye, Peter Korsgaard
