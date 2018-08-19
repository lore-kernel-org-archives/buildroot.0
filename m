From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Aug 2018 20:59:33 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-17
In-Reply-To: <20180818215603.04843f8d@windsurf> (Thomas Petazzoni's message of
 "Sat, 18 Aug 2018 21:56:03 +0200")
References: <20180818060019.8702120DE6@mail.bootlin.com>
 <20180818215603.04843f8d@windsurf>
Message-ID: <871saunpwq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> aarch64 | python-pyqt5-5.7 | NOK |
 >> http://autobuild.buildroot.net/results/36598fac615b3f138e41e8dd1df903558cde765c
 >> |

 > This is due to a Qt method that has been removed in Qt 5.11. It can be
 > fixed by applying
 > https://src.fedoraproject.org/rpms/python-qt5/c/47fb7fdc5d16582772f9c3fc8a6a674a41a7f605?branch=master,
 > but we need to find a way to make this conditional on Qt 5.11 (indeed
 > with Qt 5.6, this should be preserved).

I believe this can be done by checking QT_VERSION:

https://doc.qt.io/qt-5/qtglobal.html#QT_VERSION

-- 
Bye, Peter Korsgaard
