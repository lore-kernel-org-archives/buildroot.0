From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 19:23:45 +0200
Subject: [Buildroot] [PATCH v3 2/2] python-pyqt: new package
In-Reply-To: <1429430633-12267-2-git-send-email-gwenj@trabucayre.com>
References: <1429430633-12267-1-git-send-email-gwenj@trabucayre.com>
 <1429430633-12267-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150419192345.3ec38d2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael,

On Sun, 19 Apr 2015 10:03:53 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Cc: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>

Patch applied, after doing some additional changes:

    [Thomas:
     - Remove dependency on python (already a dependency of python-sip),
       and add a dependency on host-python-sip, since python-sip no longer
       depends on host-python-sip.
     - Make the code Python 2 / Python 3 compatible (both have been
       tested).
     - Fix indentation all over the place.
     - Remove double quotes when defining variable values, not needed.
     - Add <pkg>_BUILD_CMDS to do the build process separately from the
       installation.
     - Create a PYTHON_PYQT_CONF_OPTS variable with all the config
       options, since some of them are now conditional.
     - Use 'compileall' to byte-compile the dummy __init__.py.]

I also made a fix on python-sip to make things build properly on Python 3.

I tested PyQt with both Python 2 and Python 3, and I was able to run:

>>> from PyQt4 import QtCore
>>> QtCore.QDateTime.currentDateTime()
PyQt4.QtCore.QDateTime(2015, 4, 19, 16, 59, 12, 794)

in both cases. Don't hesitate to test with bigger applications to
confirm that everything is still working fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
