From: Niels Skou Olsen <niels@tonebarker.dk>
Date: Sun, 13 Mar 2016 17:37:40 +0100
Subject: [Buildroot] [PATCH 1/1] kbd: fix target install
In-Reply-To: <20160312220146.GA3745@free.fr>
References: <1457786638-13861-1-git-send-email-niels@tonebarker.dk>
 <20160312220146.GA3745@free.fr>
Message-ID: <07F301C1-C92E-4EC9-B9FB-33FBF50E56FA@tonebarker.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 12. mar. 2016, at 23.01, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> 
> Niel, All,
> 
> On 2016-03-12 13:43 +0100, Niels Skou Olsen spake thusly:
>> The package makefile fails to append to the KBD_INSTALL_TARGET_OPTS variable in
>> autotools-package. This means that the DESTDIR and install target are lost, and
>> so the package is never installed to target.
>> 
>> To fix it the append must happen after the eval of autotools-package.
> 
> We don;t usually do that.
> 
> Instead, when the package does not behave properly, we prefer to
> override all of it, like, for example, in  the rpm package:

OK, I agree that overriding is cleaner. I will re-submit a kbd patch that overrides instead of appending.

Btw, I just grepped through the packages, and found that util-linux does the same. It appends to autotools-package and host-autotools-package variables *after* evaluating the macros. 

Best regards,
Niels

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160313/4237fbf7/attachment.html>
