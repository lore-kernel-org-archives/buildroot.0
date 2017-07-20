From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 09:56:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
 of host-python
In-Reply-To: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
Message-ID: <20170720095636.72423497@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 15:33:17 +0800, Diankun Zhang wrote:

> The python buildin module _hashlib has dependency on library
> libcrypto.so to provide the SHA-224, SHA-256, SHA-384, SHA-512
> hash algorithms in addition to platform optimized versions
> of MD5 and SHA1. Adding host package dependency on host-openssl
> to support the building of _hashlib module for host-python.
> 
> Signed-off-by: Diankun Zhang <kundy.zhang@gmail.com>

Why do you need the _hashlib module in the host-python ?

Indeed, we try to avoid adding too many dependencies, and adding a new
dependency to host-python is going to increase the build time to a
large number of people who don't necessarily need the _hashlib module
in the host Python interpreter.

So could you explain why this is needed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
