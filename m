From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:29:44 +0100
Subject: [Buildroot] [PATCH 2/5] package/unzip: fix URL of patches
In-Reply-To: <20210117175208.366428-2-fontaine.fabrice@gmail.com>
References: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
 <20210117175208.366428-2-fontaine.fabrice@gmail.com>
Message-ID: <20210118222944.13ef7ead@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 18:52:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://sources.debian.org/data/main/u/unzip/6.0-25 is unreachable so
> replace it by
> https://sources.debian.org/data/main/u/unzip/6.0-26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The problem is that this patch is not really going to fix it for the
long term. Stuff on sources.debian.org come and goes, which is why we
use snapshot.debian.org whenever possible.

So we should probably use
http://snapshot.debian.org/archive/debian-debug/20210110T203547Z/pool/main/u/unzip/unzip_6.0-26.debian.tar.xz
which contains all the Debian patches, but at a stable URL.

Could you have a look at doing this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
