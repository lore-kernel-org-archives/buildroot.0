From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 18:56:12 +0100
Subject: [Buildroot] [PATCH v5 1/3] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <CAHXCMMK00FKgwO0iHs3J3kguRsFvMD5hfBgUUJ8dKcdKw0CDSQ@mail.gmail.com>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
 <CAHXCMMK00FKgwO0iHs3J3kguRsFvMD5hfBgUUJ8dKcdKw0CDSQ@mail.gmail.com>
Message-ID: <20150310185612.10d9db1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 10 Mar 2015 18:35:21 +0100, Samuel Martin wrote:

> > +ifeq ($$($(2)_SUPPORTS_IN_SOURCE_BUILD), no)
> s/, no/,no/

Actually it should be 'NO' and not 'no'. All other package infra
variables have upper-case values.

I know I suggested the SUPPORTS_IN_SOURCE_BUILD name, but what worries
me a bit is that if one day we want to make the default to build things
out of tree, a variable named <pkg>_SUPPORTS_IN_SOURCE_BUILD would not
make much sense anymore. It would have to be named
<pkg>_REQUIRES_IN_SOURCE_BUILD, set to NO by default in the package
infra, and that can be overridden to YES by those packages that don't
support out of tree build.

So I'm not sure what to do know. Go with <pkg>_SUPPORTS_IN_SOURCE_BUILD
for the moment, and change that when time comes?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
