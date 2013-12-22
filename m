From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:50:07 +0100
Subject: [Buildroot] [git commit] qt5: version bump
In-Reply-To: <20131219153646.2EE009C0F1@busybox.osuosl.org>
References: <20131219153646.2EE009C0F1@busybox.osuosl.org>
Message-ID: <20131222185007.590a5af4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincente,

On Thu, 19 Dec 2013 16:33:47 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=e4a839277f7d74104e25fb4fd846f9c2bf3f9c1e
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> -bump version to 5.2.0
> -remove unneeded patches
> -remove invalid configure options
> 
> [Peter: uclibc-no-lfs + qatomic patches still needed, new patch for uClibc]
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

This commit broke the build of qt5jsbackend, because it no longer
exists in Qt 5.2 apparently. See:

  http://autobuild.buildroot.org/results/d39/d399c08380c1713474cc9d9822af5f396b7d2ab6/build-end.log
  http://download.qt-project.org/official_releases/qt/5.2/5.2.0/submodules/

According to
http://blog.qt.digia.com/blog/2013/09/30/qt-5-2-alpha-available/:

"""
The QML engine has undergone some intensive work over the last 9
months, and the first results can be seen in Qt 5.2. Qt Qml is now
using its own built-in Javascript engine and does not depend on V8
anymore. As such the QtJSBackend shared library has disappeared.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
