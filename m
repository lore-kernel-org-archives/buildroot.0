From: Michael Morscher <michael.morscher@hs-augsburg.de>
Date: Thu, 16 Jun 2011 16:07:04 +0200
Subject: [Buildroot] QT 4.7.3 failes with current git version
Message-ID: <4DFA0E08.9060603@hs-augsburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys,

I currently wanted to try out QT on my mini2440 but failed compiling QT
4.7.3.
The strange thing is, that it worked (using nearly the same old config
of mine) with 2011.05 final, but the current git fails. Any ideas? Thanks.

BR Config is posted here: http://pastebin.com/XZz4dE0a

make[2]: Entering directory
`/elinux/buildroot-test/output/build/qt-4.7.3/src/gui'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory
`/elinux/buildroot-test/output/build/qt-4.7.3/src/gui'
cd src/script/&&  /usr/bin/make -f Makefile
make[2]: Entering directory
`/elinux/buildroot-test/output/build/qt-4.7.3/src/script'
compiling ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp
compiling ../3rdparty/javascriptcore/JavaScriptCore/runtime/Error.cpp
compiling
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.cpp
compiling
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorPrototype.cpp
In file included from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:28:0,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h:26,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.h:24,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.cpp:22:
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Register, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Register, unsigned int
inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Register, unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:48:26:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Register*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 20u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.h:46:9:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp: In
function  void* QTJSC::currentThreadStackBase() :
../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:715:42:
error:  pthread_getattr_np  was not declared in this scope
In file included from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:28:0,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h:26,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.h:24,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorPrototype.h:24,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorPrototype.cpp:22:
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Register, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Register, unsigned int
inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Register, unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:48:26:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Register*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 20u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.h:46:9:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
In file included from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:28:0,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h:26,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.h:24,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorConstructor.h:24,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/Error.cpp:28:
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Register, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Register, unsigned int
inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Register, unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:48:26:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Register*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 20u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.h:46:9:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
In file included from
../3rdparty/javascriptcore/JavaScriptCore/wtf/HashCountedSet.h:27:0,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.h:27,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:22:
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Register, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Register, unsigned int
inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Register, unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:48:26:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Register*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 20u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.h:46:9:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 64u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 64u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 64u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/SegmentedVector.h:148:17:   instantiated
from  void QTWTF::SegmentedVector<T, SegmentSize>::append(const U&)
[with U = QTJSC::Identifier, T = QTJSC::Identifier, unsigned int
SegmentSize = 64u]
../3rdparty/javascriptcore/JavaScriptCore/parser/ParserArena.h:52:72:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
compiling
../3rdparty/javascriptcore/JavaScriptCore/runtime/ExceptionHelpers.cpp
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int
inlineCapacity = 32u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:415:17:
instantiated from  void QTWTF::VectorBuffer<T,
inlineCapacity>::allocateBuffer(size_t) [with T =
QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity =
32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:808:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::reserveCapacity(size_t) [with T =
QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity =
32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:745:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t) [with T =
QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity =
32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:774:17:
instantiated from  void QTWTF::Vector<T, inlineCapacity>::resize(size_t)
[with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int
inlineCapacity = 32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/SegmentedVector.h:177:13:   instantiated
from  void QTWTF::SegmentedVector<T, SegmentSize>::clear() [with T =
QTJSC::Identifier, unsigned int SegmentSize = 64u]
../3rdparty/javascriptcore/JavaScriptCore/parser/ParserArena.h:42:44:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to
QTWTF::Vector<QTJSC::Identifier, 64u>**  increases required alignment of
target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:415:17:
instantiated from  void QTWTF::VectorBuffer<T,
inlineCapacity>::allocateBuffer(size_t) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:808:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::reserveCapacity(size_t) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:745:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:752:13:
instantiated from  const T* QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t, const T*) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:870:13:
instantiated from  void QTWTF::Vector<T, inlineCapacity>::append(const
U&) [with U = QTJSC::ExpressionNode*, T = QTJSC::ExpressionNode*,
unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/parser/Nodes.h:1087:70:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::ExpressionNode**
increases required alignment of target type [-Wcast-align]
make[2]: *** [obj/release/Collector.o] Error 1
make[2]: *** Waiting for unfinished jobs....
In file included from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:28:0,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h:26,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/InternalFunction.h:27,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSFunction.h:27,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/Executable.h:29,
                  from
../3rdparty/javascriptcore/JavaScriptCore/bytecode/EvalCodeCache.h:32,
                  from
../3rdparty/javascriptcore/JavaScriptCore/bytecode/CodeBlock.h:33,
                  from
../3rdparty/javascriptcore/JavaScriptCore/runtime/ExceptionHelpers.cpp:32:
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Register, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Register, unsigned int
inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Register, unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h:48:26:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Register*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 20u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 20u]
../3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.h:46:9:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::Identifier, unsigned int inlineCapacity = 64u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:394:50:
instantiated from  QTWTF::VectorBuffer<T,
inlineCapacity>::VectorBuffer() [with T = QTJSC::Identifier, unsigned
int inlineCapacity = 64u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:494:23:
instantiated from  QTWTF::Vector<T, inlineCapacity>::Vector() [with T =
QTJSC::Identifier, unsigned int inlineCapacity = 64u]
../3rdparty/javascriptcore/JavaScriptCore/wtf/SegmentedVector.h:148:17:   instantiated
from  void QTWTF::SegmentedVector<T, SegmentSize>::append(const U&)
[with U = QTJSC::Identifier, T = QTJSC::Identifier, unsigned int
SegmentSize = 64u]
../3rdparty/javascriptcore/JavaScriptCore/parser/ParserArena.h:52:72:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::Identifier*  increases
required alignment of target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int
inlineCapacity = 32u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:415:17:
instantiated from  void QTWTF::VectorBuffer<T,
inlineCapacity>::allocateBuffer(size_t) [with T =
QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity =
32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:808:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::reserveCapacity(size_t) [with T =
QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity =
32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:745:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t) [with T =
QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity =
32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:774:17:
instantiated from  void QTWTF::Vector<T, inlineCapacity>::resize(size_t)
[with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int
inlineCapacity = 32u, size_t = unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/SegmentedVector.h:177:13:   instantiated
from  void QTWTF::SegmentedVector<T, SegmentSize>::clear() [with T =
QTJSC::Identifier, unsigned int SegmentSize = 64u]
../3rdparty/javascriptcore/JavaScriptCore/parser/ParserArena.h:42:44:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to
QTWTF::Vector<QTJSC::Identifier, 64u>**  increases required alignment of
target type [-Wcast-align]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member
function  T* QTWTF::VectorBuffer<T, inlineCapacity>::inlineBuffer()
[with T = QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u] :
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:415:17:
instantiated from  void QTWTF::VectorBuffer<T,
inlineCapacity>::allocateBuffer(size_t) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:808:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::reserveCapacity(size_t) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:745:9:
instantiated from  void QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:752:13:
instantiated from  const T* QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t, const T*) [with T =
QTJSC::ExpressionNode*, unsigned int inlineCapacity = 8u, size_t =
unsigned int]
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:870:13:
instantiated from  void QTWTF::Vector<T, inlineCapacity>::append(const
U&) [with U = QTJSC::ExpressionNode*, T = QTJSC::ExpressionNode*,
unsigned int inlineCapacity = 8u]
../3rdparty/javascriptcore/JavaScriptCore/parser/Nodes.h:1087:70:
instantiated from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:473:78: warning:
cast from  QTWTF::AlignedBufferChar*  to  QTJSC::ExpressionNode**
increases required alignment of target type [-Wcast-align]
make[2]: Leaving directory
`/elinux/buildroot-test/output/build/qt-4.7.3/src/script'
make[1]: *** [sub-script-make_default-ordered] Error 2
make[1]: Leaving directory `/elinux/buildroot-test/output/build/qt-4.7.3'
make: *** [/elinux/buildroot-test/output/build/qt-4.7.3/.stamp_built]
Error 2
