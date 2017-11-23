From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:51:55 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: add patch to support for libressl
In-Reply-To: <20171108121143.5411-1-aduskett@gmail.com>
References: <20171108121143.5411-1-aduskett@gmail.com>
Message-ID: <20171123225155.73a4da45@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 07:11:43 -0500, Adam Duskett wrote:
> NTP currently fails to compile against LibreSSL because of checks used
> to determine the SSL library version.
> 
> Upstream-Status: Pending
> http://bugs.ntp.org/show_bug.cgi?id=3401#c3
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Arnout, Peter, Yann, I think we discussed this topic during the
Buildroot meeting, and concluded we didn't want patches in Buildroot to
enable LibreSSL compatibility with a package. Do we stand on this
position, and reject Adam's contribution on ntp?

> + #ifndef OPENSSL_VERSION_NUMBER
> ++#ifndef LIBRESSL_VERSION_NUMBER

In addition, this continue to use the LIBRESSL_VERSION_NUMBER approach,
which will fail when libressl gains support for new APIs.

Thanks in advance for giving your feedback on this patch. If nobody
complains, I'll merge :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
