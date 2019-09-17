From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:40:55 +0200
Subject: [Buildroot] [PATCH v2 1/1]
 support/dependencies/dependencies.sh: check for JSON:PP Perl module
In-Reply-To: <20190915225743.88337-1-aperez@igalia.com>
References: <20190915130113.53523-1-aperez@igalia.com>
 <20190915225743.88337-1-aperez@igalia.com>
Message-ID: <20190917224055.24d10f37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Mon, 16 Sep 2019 01:57:43 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71/
> 
> The JSON::PP Perl module is used at build time by the webkitgtk
> and wpewebkit packages.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I've applied to master, thanks. However, I did a mistake: I deleted the
Fixes line and the URL, because I thought this patch would not fix the
build issue. Indeed, I thought that it if fails today when building
wpewebkit or webkitgtk, with your patch it would simply fail earlier in
the dependencies check.

However, as I wrote this explanation I realized that
utils/genrandconfig has some logic to check the dependencies and reject
a configuration if the necessary dependencies are not met.

So indeed, your patch fixes the above issue. Unfortunately, I had
already pushed the commit, so it was too late to re-amend the commit
log.

Sorry about that :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
