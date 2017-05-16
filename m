From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 23:52:06 +0200
Subject: [Buildroot] [PATCH v1] qt5declarative: fix examples compile
	without OpenGL support
In-Reply-To: <20170516185201.7259-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 16 May 2017 20:52:01 +0200")
References: <20170516185201.7259-1-ps.report@gmx.net>
Message-ID: <87r2zo79mh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 >    main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
 >    .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
 >    main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to `vtable for QQuickFramebufferObject'
 >    .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
 >    main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to `vtable for QQuickFramebufferObject'
 >    .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
 >    .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
 >    .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
 >    .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
 >    .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to `QQuickFramebufferObject::releaseResources()'
 >    .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
 >    moc_fbitem.cpp:(.text+0x70): undefined reference to `QQuickFramebufferObject::qt_metacast(char const*)'
 >    .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call, int, void**)':
 >    moc_fbitem.cpp:(.text+0x80): undefined reference to `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
 >    .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
 >    moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined reference to `vtable for QQuickFramebufferObject'
 >    .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
 >    moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined reference to `vtable for QQuickFramebufferObject'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo for QQuickFramebufferObject'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to `QQuickFramebufferObject::releaseResources()'
 >    .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to `QQuickFramebufferObject::staticMetaObject'

 > [1] http://autobuild.buildroot.net/results/64a/64a198397736db12b73c1f693dbe1c47d73b53da

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
