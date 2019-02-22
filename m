From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 12:44:30 +0100
Subject: [Buildroot] [PATCH v1] package/qwt: needs qt5base gui support
In-Reply-To: <20190215224022.7a1ccf4c@windsurf.home> (Thomas Petazzoni's
 message of "Fri, 15 Feb 2019 22:40:22 +0100")
References: <20190215202504.24205-1-ps.report@gmx.net>
 <20190215214343.68c0b057@windsurf.home>
 <20190215215859.3ef24917@gmx.net>
 <20190215224022.7a1ccf4c@windsurf.home>
Message-ID: <878sy8m4ip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > It's indeed a bug from that patch! Look carefully at the diff of
 > 3e99c8418af904b14b01455d68c84d7b5afd261f:

 >  config BR2_PACKAGE_QWT
 >         bool "qwt"
 > -       depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 > -       select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
 > -       select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 > -       select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
 > -       select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
 > +       depends on BR2_PACKAGE_QT5
 > +       select BR2_PACKAGE_QT5BASE
 > +       select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
 > +       select BR2_PACKAGE_QT5BASE_CONCURRENT

 > See how the line:

 > -       select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5

 > gets removed ?

 > So I'll apply your patch after adjusting the commit log. Thanks!

Yes, sorry about that. Thanks Peter!

-- 
Bye, Peter Korsgaard
