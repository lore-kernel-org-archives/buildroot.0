From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:27:21 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/kmod: fix build with python 3.8
In-Reply-To: <20191116170709.24124-1-fontaine.fabrice@gmail.com>
References: <20191116170709.24124-1-fontaine.fabrice@gmail.com>
Message-ID: <20191118222721.168518f2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat, 16 Nov 2019 18:07:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a patch to filter -Wl,--no-undefined as -Wl,-z,undefs is ignored by
> some ld versions:

Since "some ld versions" was not very specific, I had a closer look. -z
undefs was added by commit 97a232d7335f3bd0231fd9cd39455bde1d563922 in
upstream binutils, and this commit was first present in binutils 2.30.
So any toolchain using binutils version older than that won't have -z
undefs.

So, I've extended a bit the commit log with that information and
applied to master. Could you submit your patch upstream, with the
additional explanation of the binutils version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
