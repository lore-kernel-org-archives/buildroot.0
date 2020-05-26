From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 May 2020 11:21:12 +0200
Subject: [Buildroot] [PATCH v2] package/python-pyqt5: fix QtLocation
 module dependency
In-Reply-To: <20200516112608.8484-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 16 May 2020 13:26:08 +0200")
References: <20200516112608.8484-1-ps.report@gmx.net>
Message-ID: <87zh9vgign.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The QT module location from qt5location depends on
 > QT quick from qt5declarative.

 > From qt5location-5.14.2/src/src.pro:

 >   qtHaveModule(quick) {
 >       SUBDIRS += positioningquick location
 >       ...
 >   }

 > Adjust pyqt5 QtLocation module dependency accordingly.

 > Fixes:

 >   - http://autobuild.buildroot.net/results/122bb0a37d968cd79dc043b48f90f1ba4135491f

 >   Reading .../build/python-pyqt5-5.7/QtLocation/QtLocation.pro
 >   Project ERROR: Unknown module(s) in QT: location

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - fix python-pyqt5 QTLocation vs. QtLocation spelling

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
