From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 22:53:44 +0100
Subject: [Buildroot] [PATCH 1/2]
 package/gobject-introspection/g-ir-scanner: do not set default compiler
 values
In-Reply-To: <20200321214726.GN4290@scaer>
References: <20200320222359.88689-1-aduskett@gmail.com>
 <20200321214726.GN4290@scaer>
Message-ID: <20200322215344.GF22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-21 22:47 +0100, Yann E. MORIN spake thusly:
> On 2020-03-20 15:23 -0700, aduskett at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> > Commit 8b0aeafce2a22913e6a44818227f6a39e3225157 set 7 new variables in
> > g-ir-scanner.in:
> > 
> > export CPP="${CPP:-${HOST_DIR}/bin/@BASENAME_TARGET_CPP@}"
> > export CC="${CC:-${HOST_DIR}/bin/@BASENAME_TARGET_CC@}"
> > export CXX="${CXX:-${HOST_DIR}/bin/@BASENAME_TARGET_CXX@}"
> > CPPFLAGS="${CPPFLAGS:- at TARGET_CPPFLAGS@}"
> > CFLAGS="${CFLAGS:- at TARGET_CFLAGS@}"
> > CXXFLAGS="${CXXFLAGS:- at TARGET_CXXFLAGS@}"
> > LDFLAGS="${LDFLAGS:- at TARGET_LDFLAGS@}"
> > 
> > However, defaulting to CPP, CC, or CXX breaks some packages because they may
> > hard code CC to the system CC.
> > 
> > One such package is libostree which has the line
> > "INTROSPECTION_SCANNER_ENV = CC=gcc" in the Makefile.
> 
> But then, that's clearly a bug in libostree! They should not ever try to
> call a hard-coded compiler.
[--SNIP--]

Mu alternate proposal was just merged, so I've marked this series as
rejected. It anyway helped understand the actual problem, so it was
definitely not in vain. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
