From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:20:45 +0200
Subject: [Buildroot] [PATCH] package/qt5webkit: needs host-python
In-Reply-To: <20160726161151.GA5925@free.fr>
References: <1469486011-29173-1-git-send-email-yann.morin.1998@free.fr>
 <20160726095809.21008ed0@free-electrons.com>
 <20160726161151.GA5925@free.fr>
Message-ID: <20160726212045.29d5a07a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 18:11:51 +0200, Yann E. MORIN wrote:

> Neither do I, but see below...
> 
> > Is "python" hardcoded is so many places in Qt5Webkit ?  
> 
>     $ grep -r -E '(^|[[:space:]])python([[:space:]]|$)' |grep -v ChangeLog |wc -l
>     153
> 
> A lot of them are just doc or such, but there are still a lot of places
> that are indeed calls to the python interpreter:
> 
>     Tools/gtk/jhbuildrc:#!/usr/bin/env python
>     Tools/gtk/common.py:#!/usr/bin/env python
>     Tools/gtk/generate-gtkdoc:#!/usr/bin/env python
>     Tools/gtk/generate-feature-defines-files:#!/usr/bin/env python
>     Tools/CygwinDownloader/cygwin-downloader.py:#!/usr/bin/env python
>     Tools/efl/jhbuildrc:#!/usr/bin/env python
>     Tools/efl/common.py:#!/usr/bin/env python
>     Tools/BuildSlaveSupport/build.webkit.org-config/committer_auth_unittest.py:#!/usr/bin/env python
>     Tools/BuildSlaveSupport/wait-for-SVN-server.py:#!/usr/bin/env python
>     Tools/jhbuild/jhbuild-wrapper:#!/usr/bin/env python
>     Tools/QueueStatusServer/app.yaml:runtime: python
>     Tools/Scripts/new-run-webkit-tests:#!/usr/bin/env python
>     Tools/Scripts/validate-committer-lists:#!/usr/bin/env python
>     Tools/Scripts/run-qtwebkit-tests:#!/usr/bin/env python
>     Tools/Scripts/lint-webkitpy:#!/usr/bin/env python
>     Tools/Scripts/generate-win32-export-forwards:#!/usr/bin/env python
>     Tools/Scripts/import-w3c-tests:#!/usr/bin/env python
>     Tools/Scripts/webkitpy/layout_tests/views/buildbot_results.py:#!/usr/bin/env python
>     Tools/Scripts/webkitpy/layout_tests/views/buildbot_results_unittest.py:#!/usr/bin/env python
>     [...]
>     Source/WebCore/DerivedSources.make:     python $(WebCore)/html/parser/create-html-entity-table -o HTMLEntityTable.cpp $(WebCore)/html/parser/HTMLEntityNames.in
>     Source/WebCore/DerivedSources.make:     python $(WebCore)/inspector/generate-inspector-protocol-version -o InspectorProtocolVersion.h $(WebCore)/inspector/Inspector.json
>     Source/WebCore/DerivedSources.make:     python $(WebCore)/inspector/CodeGeneratorInspector.py $(WebCore)/inspector/Inspector.json --output_h_dir . --output_cpp_dir .
>     Source/WebCore/html/parser/create-html-entity-table:#!/usr/bin/env python
>     Source/JavaScriptCore/DerivedSources.pri:retgen.commands = python $$retgen.script > ${QMAKE_FILE_OUT}
>     Source/JavaScriptCore/DerivedSources.pri:klgen.commands = python $$klgen.script ${QMAKE_FILE_NAME} > ${QMAKE_FILE_OUT}
>     Source/JavaScriptCore/DerivedSources.pri:    disassembler.commands = python $$disassembler.script ${QMAKE_FILE_NAME} --outputDir ${QMAKE_FUNC_FILE_OUT_PATH}
>     Source/JavaScriptCore/DerivedSources.make:      python $^ > $@
>     Source/JavaScriptCore/DerivedSources.make:      python $^ > $@
>     Source/JavaScriptCore/DerivedSources.make:      (PYTHONPATH=$(JavaScriptCore)/disassembler/udis86 python $(JavaScriptCore)/disassembler/udis86/itab.py $(JavaScriptCore)/disassembler/udis86/optable.xml || exit 1)
>     [...]
> 
> So, I'm not gonna patch it either...

OK, makes sense!

> Yes, upstream is not maintaining it anymore, but it's still being
> maintained by "the community", and they are now even compatible with
> Qt-5.7.
> 
> See also the commit log of e8dbdbd (qt5webkit: restore package). ;-)

In this case, could you submit a bug report upstream to ask them to
provide a way to configure the Python to use?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
