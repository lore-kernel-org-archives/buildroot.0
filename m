From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Mar 2010 20:29:30 +0100
Subject: [Buildroot] Cross-compiling Problem with Boingo Embedded
 Wireless Toolkit for arm target
In-Reply-To: <dfcd449c1003260755n48095488u2d889fc176b1fb25@mail.gmail.com>
References: <dfcd449c1003260755n48095488u2d889fc176b1fb25@mail.gmail.com>
Message-ID: <20100326202930.052b13b0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Mar 2010 16:55:57 +0200
Viktar Palstsiuk <viktar.palstsiuk@promwad.com> wrote:

> arm-linux-uclibcgnueabi-g++: unrecognized option '-02'

As Lionel said, the option should be -O2 and not -02.

> ../../lib/http/src/HttpImp.cpp: In member function ?virtual INT8
> HttpImp::PostUrl(const CHAR*, const CHAR*, const CHAR*, const CHAR*,
> const CHAR*, const CHAR*, const CHAR*, UINT32, BOOL*)?:
> ../../lib/http/src/HttpImp.cpp:142: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::SetForm(const CHAR*, const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:211: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp:212: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetForm(const CHAR*, const CHAR*, UINT32)?:
> ../../lib/http/src/HttpImp.cpp:237: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetTag(const CHAR*, const CHAR*, const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:262: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::IsPost(const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:279: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::SetPost(const CHAR*, const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:299: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetPost(const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:318: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BOOL
> HttpImp::DropPost(const CHAR*)?:
> ../../lib/http/src/HttpImp.cpp:336: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?virtual BewtString
> HttpImp::GetPostUrl()?:
> ../../lib/http/src/HttpImp.cpp:351: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?
> ../../lib/http/src/HttpImp.cpp: In member function ?INT32
> HttpImp::sendRequest(BOOL, const CHAR*, const CHAR*, const CHAR*,
> BOOL, const CHAR*, const CHAR*, const CHAR*, UINT32, BOOL, BOOL*)?:
> ../../lib/http/src/HttpImp.cpp:459: error: invalid use of incomplete
> type ?struct Form?
> ./../../lib/interpreter/include/intenvironment.h:53: error: forward
> declaration of ?struct Form?

These seems to be specific to the bewt software and not related to
Buildroot directly.

> Here is my bewt.mk file:

Could you use the Makefile.autotools.in infrastructure instead ? See
http://buildroot.org/downloads/buildroot.html#autotools-tutorial for
details.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
