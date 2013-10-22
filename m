From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Oct 2013 16:38:46 +0200
Subject: [Buildroot] glib-networking when using gtlsconnection fails
In-Reply-To: <52603fa7.45680e0a.32e2.67d3@mx.google.com>
References: <525eb564.c664cc0a.66a5.6cee@mx.google.com>
 <52603fa7.45680e0a.32e2.67d3@mx.google.com>
Message-ID: <20131022163846.2d51ca1a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernhard Schuster,

On Thu, 17 Oct 2013 19:50:55 +0002, Bernhard Schuster wrote:
> The issue consisted of two issues:
> 
> pcre actually lacked the --enable-utf8 --enable-unicode-properties, 
> after adding them GRegex worked fine again.

Can you provide a patch that fixes that?

> The second issue is (most likely) related to how glib-networking is 
> loaded at runtime (dlopen?) and thus static linkage is doomed to fail, 
> though I have yet to prove this. Dynamic linking just works out of the 
> box.

Interesting. Could you investigate this a bit more, and if it turns out
to be true, ensure the packages get the proper "depends
on !BR2_PREFER_STATIC_LIB" dependencies?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
