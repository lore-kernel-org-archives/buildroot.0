From: bao bui <buiqbao@gmail.com>
Date: Fri, 18 Mar 2011 23:24:22 -0700
Subject: [Buildroot] qt 4.7.2 compile error
Message-ID: <AANLkTinVf+6U=UNykD0nfrTMRZx+F4-oX_5EA2hqKcQD@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to compile Qt 4.7.2 in buildroot. I got the error:

compiling util/qdeclarativestateoperations.cpp
rm -f libQtDeclarative.so.4.7.2 libQtDeclarative.so libQtDeclarative.so.4
libQtDeclarative.so.4.7
linking ../../lib/libQtDeclarative.so.4.7.2
.obj/release-shared-emb-arm/qdeclarativeview.o: In function
`QDeclarativeView::setRootObject(QObject*)':
qdeclarativeview.cpp:(.text+0x22e4): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativepackage.o: In function
`QList<QDeclarativePackagePrivate::DataGuard>::detach_helper()':
qdeclarativepackage.cpp:(.text._ZN5QListIN26QDeclarativePackagePrivate9DataGuardEE13detach_helperEv[QList<QDeclarativePackagePrivate::DataGuard>::detach_helper()]+0x2a0):
undefined reference to `QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativepackage.o: In function
`QList<QDeclarativePackagePrivate::DataGuard>::append(QDeclarativePackagePrivate::DataGuard
const&)':
qdeclarativepackage.cpp:(.text._ZN5QListIN26QDeclarativePackagePrivate9DataGuardEE6appendERKS1_[QList<QDeclarativePackagePrivate::DataGuard>::append(QDeclarativePackagePrivate::DataGuard
const&)]+0x7d0): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativepackage.o: In function
`QDeclarativePackagePrivate::data_append(QDeclarativeListProperty<QObject>*,
QObject*)':
qdeclarativepackage.cpp:(.text._ZN26QDeclarativePackagePrivate11data_appendEP24QDeclarativeListPropertyI7QObjectEPS1_[QDeclarativePackagePrivate::data_append(QDeclarativeListProperty<QObject>*,
QObject*)]+0x19c): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativeanimation.o: In function
`QDeclarativeAbstractAnimation::setRunning(bool)':
qdeclarativeanimation.cpp:(.text+0x6bc8): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativeanimation.o:qdeclarativeanimation.cpp:(.text._ZN16QDeclarativeData3getEPK7QObjectb[QDeclarativeData::get(QObject
const*, bool)]+0x118): more undefined references to
`QAbstractDeclarativeData::objectNameChanged' follow
.obj/release-shared-emb-arm/qdeclarativetextinput.o: In function
`QDeclarativeTextInput::cursorPosChanged()':
qdeclarativetextinput.cpp:(.text+0x1d70): undefined reference to
`QLineControl::resetCursorBlinkTimer()'
.obj/release-shared-emb-arm/qdeclarativevisualitemmodel.o: In function
`QDeclarativeVisualDataModelData::QDeclarativeVisualDataModelData(int,
QDeclarativeVisualDataModel*)':
qdeclarativevisualitemmodel.cpp:(.text+0x2d2c): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevisualitemmodel.o: In function
`QDeclarativeVisualDataModelPrivate::QDeclarativeVisualDataModelPrivate(QDeclarativeContext*)':
qdeclarativevisualitemmodel.cpp:(.text+0x3614): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevisualitemmodel.o: In function
`QDeclarativeVisualDataModelPrivate::QDeclarativeVisualDataModelPrivate(QDeclarativeContext*)':
qdeclarativevisualitemmodel.cpp:(.text+0x3ccc): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevisualitemmodel.o: In function
`QDeclarativeVisualDataModelData::QDeclarativeVisualDataModelData(int,
QDeclarativeVisualDataModel*)':
qdeclarativevisualitemmodel.cpp:(.text+0x43f4): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevisualitemmodel.o: In function
`QDeclarativeGuard<QDeclarativeVisualDataModel>::operator=(QDeclarativeVisualDataModel*)':
qdeclarativevisualitemmodel.cpp:(.text._ZN17QDeclarativeGuardI27QDeclarativeVisualDataModelEaSEPS0_[QDeclarativeGuard<QDeclarativeVisualDataModel>::operator=(QDeclarativeVisualDataModel*)]+0x174):
undefined reference to `QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativelistview.o:qdeclarativelistview.cpp:(.text+0x930):
more undefined references to `QAbstractDeclarativeData::objectNameChanged'
follow
.obj/release-shared-emb-arm/qdeclarativetextlayout.o: In function
`(anonymous namespace)::DrawTextItemRecorder::drawTextItem(QPointF const&,
QTextItem const&)':
qdeclarativetextlayout.cpp:(.text+0x17d8): undefined reference to
`QStaticTextItem::setFontEngine(QFontEngine*)'
qdeclarativetextlayout.cpp:(.text+0x1854): undefined reference to
`QStaticTextItem::~QStaticTextItem()'
.obj/release-shared-emb-arm/qdeclarativetextlayout.o: In function
`QVector<QStaticTextItem>::free(QVectorTypedData<QStaticTextItem>*)':
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE4freeEP16QVectorTypedDataIS0_E[QVector<QStaticTextItem>::free(QVectorTypedData<QStaticTextItem>*)]+0x30):
undefined reference to `QStaticTextItem::~QStaticTextItem()'
.obj/release-shared-emb-arm/qdeclarativetextlayout.o: In function
`QVector<QStaticTextItem>::realloc(int, int)':
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE7reallocEii[QVector<QStaticTextItem>::realloc(int,
int)]+0x1c8): undefined reference to
`QStaticTextItem::setFontEngine(QFontEngine*)'
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE7reallocEii[QVector<QStaticTextItem>::realloc(int,
int)]+0x2f0): undefined reference to `QStaticTextItem::~QStaticTextItem()'
.obj/release-shared-emb-arm/qdeclarativetextlayout.o: In function
`QVector<QStaticTextItem>::append(QStaticTextItem const&)':
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE6appendERKS0_[QVector<QStaticTextItem>::append(QStaticTextItem
const&)]+0xf0): undefined reference to
`QStaticTextItem::setFontEngine(QFontEngine*)'
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE6appendERKS0_[QVector<QStaticTextItem>::append(QStaticTextItem
const&)]+0x224): undefined reference to
`QStaticTextItem::setFontEngine(QFontEngine*)'
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE6appendERKS0_[QVector<QStaticTextItem>::append(QStaticTextItem
const&)]+0x22c): undefined reference to
`QStaticTextItem::~QStaticTextItem()'
qdeclarativetextlayout.cpp:(.text._ZN7QVectorI15QStaticTextItemE6appendERKS0_[QVector<QStaticTextItem>::append(QStaticTextItem
const&)]+0x350): undefined reference to
`QStaticTextItem::setFontEngine(QFontEngine*)'
.obj/release-shared-emb-arm/qdeclarativevmemetaobject.o: In function
`QDeclarativeVMEMetaObject::QDeclarativeVMEMetaObject(QObject*, QMetaObject
const*, QDeclarativeVMEMetaData const*, QDeclarativeCompiledData*)':
qdeclarativevmemetaobject.cpp:(.text+0x1a0c): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevmemetaobject.o: In function
`QDeclarativeVMEMetaObject::QDeclarativeVMEMetaObject(QObject*, QMetaObject
const*, QDeclarativeVMEMetaData const*, QDeclarativeCompiledData*)':
qdeclarativevmemetaobject.cpp:(.text+0x20a8): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevmemetaobject.o: In function
`QDeclarativeVMEMetaObject::writeVarProperty(int, QVariant const&)':
qdeclarativevmemetaobject.cpp:(.text+0x2774): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativevmemetaobject.o: In function
`QDeclarativeVMEVariant::setValue(QObject*)':
qdeclarativevmemetaobject.cpp:(.text._ZN22QDeclarativeVMEVariant8setValueEP7QObject[QDeclarativeVMEVariant::setValue(QObject*)]+0x308):
undefined reference to `QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativeengine.o: In function
`QDeclarativeEnginePrivate::init()':
qdeclarativeengine.cpp:(.text+0xf50): undefined reference to
`QAbstractDeclarativeData::objectNameChanged'
.obj/release-shared-emb-arm/qdeclarativeengine.o:qdeclarativeengine.cpp:(.text+0x19e0):
more undefined references to `QAbstractDeclarativeData::objectNameChanged'
follow
collect2: ld returned 1 exit status
make[2]: *** [../../lib/libQtDeclarative.so.4.7.2] Error 1
make[2]: Leaving directory
`/home/bao/work/buildroot/output/build/qt-everywhere-opensource-src-4.7.2/src/declarative'
make[1]: *** [sub-declarative-make_default-ordered] Error 2
make[1]: Leaving directory
`/home/bao/work/buildroot/output/build/qt-everywhere-opensource-src-4.7.2'
make: ***
[/home/bao/work/buildroot/output/build/qt-everywhere-opensource-src-4.7.2/.compiled]
Error 2


How can I fix that?

Thanks

BAO
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110318/4441ee15/attachment.html>
