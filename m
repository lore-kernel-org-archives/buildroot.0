From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:21:24 +0200
Subject: [Buildroot] [PATCH v2 1/1] msgpack: bump version to 2.1.5
In-Reply-To: <CAPpUvYgiu5yFpi=aCgE86+3UCsApo2vGS_Mi9Q12OOdtRvUsOw@mail.gmail.com>
References: <20170918155824.26180-1-bradford@density.io>
 <d47c2464-2e30-0ec9-ccef-2848af01f507@mind.be>
 <CAPpUvYgiu5yFpi=aCgE86+3UCsApo2vGS_Mi9Q12OOdtRvUsOw@mail.gmail.com>
Message-ID: <20171008232124.3010643a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Sep 2017 21:13:31 -0400, Bradford Barr wrote:

> The default "make install" installs all of the header files, cmake
> modules, pkg-config files, and the static library along side the
> dynamic libraries. I figured it'd be best if the package just
> installed the dynamic libraries on the target. Let me know if you'd
> prefer the default "make install".

What you did is not needed at all: Buildroot already removes header
files, pkg-config files, static libraries, etc. from $(TARGET_DIR) at
the end of the build.

If you drop your custom installation command, here is what is left from
msgpack in $(TARGET_DIR) at the end of the buid:

output/target/usr/lib/libmsgpackc.so
output/target/usr/lib/libmsgpackc.so.2.0.0
output/target/usr/lib/libmsgpackc.so.2

Which is exactly what we want.

Also, I've added LICENSE_1_0.txt to the list of license files, because
COPYING was not very useful by itself.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
