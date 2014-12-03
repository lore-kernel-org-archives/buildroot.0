From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2014 22:22:18 +0100
Subject: [Buildroot] [PATCH] lzma: repair build
In-Reply-To: <1417640549-589-1-git-send-email-vincent.stehle@laposte.net>
References: <1417640549-589-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <20141203222218.6c910bdc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Wed,  3 Dec 2014 22:02:29 +0100, Vincent Stehl? wrote:
> The build of host-lzma is broken since commit 97703978ac870ce2
> ("support/libtool: make -static behave like -all-static").
> 
> Lzma forces '-static' in its LDFLAGS, which contradicts what buildroot tries to
> achieve by patching libtool scripts and configuring host packages with
> '--disable-static'.
> 
> We add a patch to remove lzma's hardcoded LDFLAGS, to fix the build.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Do you think this patch could be submitted upstream to lzma? It really
doesn't make sense for them to force static linking.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
