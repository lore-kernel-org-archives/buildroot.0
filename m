From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Apr 2019 12:23:39 +0200
Subject: [Buildroot] Wrong license information in package
 qt5quickcontrols2?
In-Reply-To: <017c92fcfda14fe3b07c0dcc70bbaf5e@erbe-med.com>
References: <017c92fcfda14fe3b07c0dcc70bbaf5e@erbe-med.com>
Message-ID: <d6920a5b-217c-8dd6-3d0e-f4b163ad2e17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2019 16:43, Steinhilber, Markus wrote:
> Hi,
> 
> I think the license information in the package qt5quickcontrols2 is wrong. But since I'm not an expert on licensing I didn't want to post a patch.
> 
> The .mk file includes this line: "QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)", but on the Qt Website(https://doc.qt.io/qt-5/qtquickcontrols-index.html) it states: "Qt Quick Controls 2 is available under commercial licenses from The Qt Company. In addition, it is available under the GNU Lesser General Public License, version 3, or the GNU General Public License, version 2." So from this info I would say the .mk file should contain "QT5QUICKCONTROLS2_LICENSE = GPL-2.0 or LGPL-3.0, GFDL-1.3 (docs)".
> 
> But one thing that is even more confusing to me, is that the source folder of the package contains license files for GPL2, GPL3 and LGPL3, so from my understanding I should be able to choose any one of those licenses. So it should really be "QT5QUICKCONTROLS2_LICENSE = GPL-2.0, GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)". Am I correct?
> 
> Can someone with more knowledge on licensing confirm or disapprove on this?

 The only somewhat reliable source of information for licensing is each
individual source file. So the correct way to go about it is to check each
individual source file and check it's license.

 The three individual license files are included because depending on the
situation, either of them could apply.

 In this case we're lucky because all source files contain the same license
header. This header specifies: commercial OR LGPL-3.0 OR GPL-2.0+. So you are
correct, the license information in Buildroot is wrong. It should be:

QT5QUICKCONTROLS2_LICENSE = GPL-2.0+ or LGPL-3.0, GFDL-1.3 (docs)

 Note that the docs should only be mentioned if they are in fact installed on
the target. I'm not sure if that is the case here. Anyway, that's a separate
issue and in general we're not very consistent in that.

 Oh and I also checked that both 5.6 and 5.12 have the same license - that's not
always the case either.

 So, feel free to send a patch to fix this!

 Regards,
 Arnout
