From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 13:20:26 +0100
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <CA+hj=MpO+iC+YwcHcBsSL7kNMfFAhaV8MZz-mai86tnOD6E3Qw@mail.gmail.com>
References: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
 <20140102044704.GF6589@tarshish>
 <CA+hj=Mqv-+aJiSYFDZUnh_3Est=aC26CfC6kr_FkqM58sjNj3Q@mail.gmail.com>
 <20140102091925.GO6589@tarshish>
 <CA+hj=MoPxwwNn76Sh3vgP5VpkFsUn6uMRKtYW76a-A4DpoMkxg@mail.gmail.com>
 <20140102103439.GW6589@tarshish>
 <CA+hj=MpO+iC+YwcHcBsSL7kNMfFAhaV8MZz-mai86tnOD6E3Qw@mail.gmail.com>
Message-ID: <20140102132026.68c0bb25@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Wagner,

On Thu, 2 Jan 2014 11:37:58 +0100, Ivan Wagner wrote:

> yes you're right it's quite unusual in fact I changed it to little
> endian but I still see the same toolchain paths that aren't pointing
> to the custom pre-installed I've selected.

It is expected that the compiler isn't pointing directly to your
external toolchain. Buildroot compiles a small wrapper around the
external toolchain, in order to pass some appropriate arguments when
the external compiler is called. Therefore it is perfectly normal that
the compiler is called output/host/usr/bin/arm-<something>-gcc. Any
other value would be wrong.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
