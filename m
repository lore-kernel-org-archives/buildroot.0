From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:59:28 +0100
Subject: [Buildroot] [PATCH next] tpm2-tss: depend on shared libraries
In-Reply-To: <20181119044123.19463-1-casantos@datacom.com.br>
References: <20181119044123.19463-1-casantos@datacom.com.br>
Message-ID: <20181119215928.4d913218@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 19 Nov 2018 02:41:23 -0200, Carlos Santos wrote:
> The code includes dlfcn.h even if --enable-static and --disable-shared
> are passed to configure. There is an "#ifndef NO_DL ... #endif" wrapper
> but NO_DL is never defined and adding "-DNO_DL" to CFLAGS causes other
> compilation errors.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/cfc3bfef5e93329bf944a57947086d9ddc4fece3
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

You need to propagate this dependency to the reverse dependencies of
tpm2-tss.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
