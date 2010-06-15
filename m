From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jun 2010 09:37:36 +0200
Subject: [Buildroot] [Re:  Valgrind compilation, with patch 3.5.0,
 need help]
In-Reply-To: <4C1726CE.8080009@terawatt.fr>
References: <4C1726CE.8080009@terawatt.fr>
Message-ID: <20100615093736.1872e8e7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

On Tue, 15 Jun 2010 09:07:58 +0200
Damien Borie <dbe@terawatt.fr> wrote:

> So, I tried to compile Valgrind version 3.5.0. I only change the version
> number in Config.in file (in package/valgrind/). 'make source' cause the
> package download without problems. Then 'make' doesn't cause error but
> it try to apply a patch ('valgrind-largefile patch'). This patch modify
> a file 'coregrind/m_ume.c' and ask me to type a path to a file to patch,
> with no others precisions.

It means that the file the patch is modifying doesn't exist anymore in
newer versions of Valgrind. So you need to see whether the patch is
still needed or not. From a quick look, it looks like it does.

Attached is a updated version of the patch for Valgrind 3.5.0. I haven't
tested it *at all*, I haven't even built Valgrind with this patch. But
at least, it applies on Valgrind 3.5.0.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: valgrind-3.5.0-largefile.patch
Type: text/x-patch
Size: 2435 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100615/aa15e560/attachment.bin>
