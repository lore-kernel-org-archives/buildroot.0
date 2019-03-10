From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Sun, 10 Mar 2019 16:14:26 +0100
Subject: [Buildroot] issue to build elfutils due to libintl
In-Reply-To: <20190308234947.274e5d36@gmx.net>
References: <20190308125638.GA30079@arthur-bzh>
 <20190308234947.274e5d36@gmx.net>
Message-ID: <20190310151426.GA11489@arthur-bzh>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to you I was able to know that the libintl include was comming from the uclibc.
The header was partially missing in my output directory. After checking my uclibc
defconfig, I get it.
In fact I have one custom modification on my buildroot. My uclibc defconfig does not have :
UCLIBC_HAS_LIBINTL=y

But I cannot explain why the compilation is working on my arch linux and was working before the
upgrading in my ubuntu.

This is not a real bug right ? Its more like a mistake in my uclibc defconfig which seems not
to break the build for dark reason on some linux configuration ?
