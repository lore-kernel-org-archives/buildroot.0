From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Feb 2011 09:41:23 +0100
Subject: [Buildroot] build python failed
In-Reply-To: <AANLkTinfpWsELrvHSZYq1+w-W_zF6fgoSVgPEMVYxvjg@mail.gmail.com>
	(Marco's message of "Mon, 21 Feb 2011 16:33:31 +0800")
References: <AANLkTinfpWsELrvHSZYq1+w-W_zF6fgoSVgPEMVYxvjg@mail.gmail.com>
Message-ID: <871v31eq4s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco  <chopin1998@gmail.com> writes:

 Marco> Hi, All

 Marco> ??? my buildroot has git pulled, and my target is at91sam9260. I
 Marco> choose python package via make menuconfig, but make failed:


 Marco>     In file included from Include/Python.h:86,
 Marco>     ???????????????? from ./Modules/python.c:4:
 Marco>     Include/unicodeobject.h:575: warning: type defaults to 'int' in declaration
 Marco>     of 'wchar_t'

It doesn't find the wchar_t type.

Python does depend on wchar support in the toolchain, so you probably
have done a build without wchar, and then gone and added wchar support
and python without doing a clean rebuild.

For this kind of toolchain changes you need to do make clean; make.


-- 
Bye, Peter Korsgaard
