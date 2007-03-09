From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 09 Mar 2007 21:30:55 +0200
Subject: [Buildroot] [RFC/PATCH 2/3] fix buildroot sed handling on Mac
 OS X
In-Reply-To: <20070309083530.GC11011@aon.at>
References: <45E17186.2080208@cs.helsinki.fi> <20070308163826.GD1389@aon.at>
	<45F083D7.9050100@cs.helsinki.fi> <20070309083530.GC11011@aon.at>
Message-ID: <45F1B5EF.8010605@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> On Thu, Mar 08, 2007 at 11:44:55PM +0200, Heikki Lindholm wrote:
> 
>>Bernhard Fischer kirjoitti:
>>
>>>On Sun, Feb 25, 2007 at 01:22:46PM +0200, Heikki Lindholm wrote:
>>>
>>>
>>>>Include a patch for GNU sed that allows building it on Mac OS X and
>>>>remove a spurious --prefix from sed.mk.
> 
> 
>>>It is not immediately apparent to me why you need this patch. Please
>>>elaborate.
>>
>>Nor to me. But it seems to fix a sed incompatibility - it's funny, but 
>>building GNU sed does seem to require GNU sed. If I try to build 
>>sed-4.1.5 on OS X without this patch, ./configure fails with
>>sed: 1: "install_sh=/tmp/sed-4.1 ...": command i expects \ followed by text
>>sed: 1: "install_sh=/tmp/sed-4.1 ...": command i expects \ followed by text
>>The patch itself is just copied from Darwinports (macports these days.)
> 
> 
> applied, thanks.

Dammit. There was still one bug left:

The sed.mk makefile uses both absolute install prefix and DESTDIR 
pointing to the same dir. Fix by removing DESTDIR.

-- Heikki Lindholm

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070309-sed-hostinstall.patch
Url: http://busybox.net/lists/buildroot/attachments/20070309/eb600d9b/attachment.asc 
