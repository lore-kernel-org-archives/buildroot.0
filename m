From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 15 Dec 2006 14:45:37 +0100
Subject: [Buildroot] [patch] fakeroot does not apply patches
In-Reply-To: <200612151417.58106.uli@suse.de>
References: <200612151417.58106.uli@suse.de>
Message-ID: <20061215134537.GA13485@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 15, 2006 at 02:17:57PM +0100, Ulrich Hecht wrote:
>Hi!
>
>This patch makes sure the no-docs patch for fakeroot is applied when 
>building for the target.

Several packages unpack their sources twice. These should ideally be
build out of tree for one make (i'd generally do it for the dir2, i.e.
the host).

Uli, could you perhaps try if fakeroot builds out of tree? Several
packages may not support this and should receive upstream-fixes to make
them behave, IMHO.

TIA,
Bernhard
