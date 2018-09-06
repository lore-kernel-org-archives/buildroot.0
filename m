From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Sep 2018 21:31:07 +0200
Subject: [Buildroot] [PATCH v2] qt5location: fix build failure due to
 GCC < 5.x bug in implicit casts
In-Reply-To: <20180905141946.130225-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 5 Sep 2018 16:19:46 +0200")
References: <20180905141946.130225-1-giulio.benetti@micronovasrl.com>
Message-ID: <87wory779g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > GCC < 5.x has some bug in implicit casts, this leads to build failure.
 > In particular QPointer<QGeoMap> in m_map QDeclarativeGeoMap class, when
 > passed to connect(m_map, ...) should directly cast to m_map.data().

 > Add reworked patch referred on QTBUG-69512:
 > https://bugreports.qt.io/browse/QTBUG-69512

 > Fixes:
 > http://autobuild.buildroot.org/results/dc5/dc5c354f3aae54b77dad74ad44aca6d12425a457/
 > http://autobuild.buildroot.org/results/3ab/3ab6f79a36543fa677555bc9ec3500baa46ab0f8/
 > http://autobuild.buildroot.org/results/8b5/8b5531e44c4f4258c950902b2cd92d1ac8a8491e/
 > http://autobuild.buildroot.org/results/089/089d03ab14a7c70e465cce891506a082049f2998/
 > http://autobuild.buildroot.org/results/da8/da87ca470b22d599bb25998af8f25136921f35a7/
 > http://autobuild.buildroot.org/results/5fe/5fe91fd762c5d4eda01378947b13f7ffc084a8be/
 > http://autobuild.buildroot.org/results/a84/a84182145122935c8f10105818dbf0e3aa23fd11/
 > http://autobuild.buildroot.org/results/5b9/5b9106351a04646f42697215ed497e09c62c12fa/
 > http://autobuild.buildroot.org/results/397/397acc3f5d4998a8d632749ef7d21533c35d501a/
 > http://autobuild.buildroot.org/results/b18/b186ec0e297d6857a9e0a6a063e476b5049ccf93/
 > http://autobuild.buildroot.org/results/bf2/bf241beeb1ce10eec99d247cdd331870c08e0ac8/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > ---
 > Changes V1->V2:
 > * move patch to qt5location/5.11.1 folder since it's specific to 5.11.1 version

So the 5.6 version doesn't need to be patched?

Committed, thanks.

-- 
Bye, Peter Korsgaard
