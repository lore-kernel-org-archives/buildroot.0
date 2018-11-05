From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 5 Nov 2018 17:59:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-01
In-Reply-To: <20181102070019.EB5432089C@mail.bootlin.com>
References: <20181102070019.EB5432089C@mail.bootlin.com>
Message-ID: <20181105175930.GB16070@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

On Fri,  2 Nov 2018 08:00:19 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> [...]
>
>       mipsel |               webkitgtk-2.22.3 | NOK | http://autobuild.buildroot.net/results/eeaf3edbf6f5bf468b10adc3d053f703c6ceba96 |     
>
> [...]

This is due to the JavaScriptCore JIT not working on MIPS R6 due to it using
some MIPS instructions which were removed in R6. I have reported the issue
upstream [1] in the WebKit Bugzilla.

The autobuilder failure will be fixed by this patch which disables the JIT
support on MIPS R6:

    https://patchwork.ozlabs.org/patch/993066/

Best regards,

-Adri?n

---
[1] https://bugs.webkit.org/show_bug.cgi?id=191258
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181105/ace9a775/attachment.asc>
