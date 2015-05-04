From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 May 2015 15:52:03 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87h9rtucot.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 03 May 2015 13:23:46 +0200")
References: <20150502063016.3950D100FB0@stock.ovh.net>
 <20150503105009.2b42c375@free-electrons.com>
 <87h9rtucot.fsf@dell.be.48ers.dk>
Message-ID: <878ud4qwl8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 > Hi,

 >> Hello,
 >> On Sat,  2 May 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote:

 >>> mips64el | qt-4.8.6 | NOK |
 >>> http://autobuild.buildroot.net/results/3c50ed4bb15ab35341c7682ce4706b7a05a6f702/
 >>> mips64el | qt-4.8.6 | NOK |
 >>> http://autobuild.buildroot.net/results/07aca0c27a07761621d46fb690e3ccd50cbc2ef5/

 >> error: redefinition of 'bool QTest::qCompare

 >> Needs investigation.

 > Sounds related to:

 > http://lists.busybox.net/pipermail/buildroot/2015-April/127153.html

 > We currently only allow BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE for soft
 > float toolchains, but perhaps it needs to also be disallowed for mips64?
 > Richard, care to take a look?

QT_COORD_TYPE_DOUBLE also causes issues with python-pyqt because of
qreal* -> float* conversion. Could you take a look?

http://autobuild.buildroot.net/results/891/891dc6ad46039740867a0b436281fc489cfb2772/build-end.log

-- 
Bye, Peter Korsgaard
