From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Oct 2019 14:15:50 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/libopenssl: set no-asm with generic architectures
In-Reply-To: <20191018165644.26442-1-fontaine.fabrice@gmail.com>
References: <20191018165644.26442-1-fontaine.fabrice@gmail.com>
Message-ID: <20191019141550.50e36e3f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Oct 2019 18:56:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use no-asm when building statically with a generic architecture such as
> gcc or linux-generic32, see
> https://github.com/openssl/openssl/issues/9839

This doesn't match what you are doing in the code. In the commit log
you say that you're passing no-asm when building statically with gcc or
linux-generic32.

In the code, you are *always* passing no-asm with linux-generic32, even
for non-static builds. Is this intended ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
