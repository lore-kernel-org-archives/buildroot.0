From: Bernhard Schuster <schuster.bernhard@googlemail.com>
Date: Thu, 17 Oct 2013 19:50:55 +0002
Subject: [Buildroot] glib-networking when using gtlsconnection fails
In-Reply-To: <525eb564.c664cc0a.66a5.6cee@mx.google.com>
References: <525eb564.c664cc0a.66a5.6cee@mx.google.com>
Message-ID: <52603fa7.45680e0a.32e2.67d3@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The issue consisted of two issues:

pcre actually lacked the --enable-utf8 --enable-unicode-properties, 
after adding them GRegex worked fine again.

The second issue is (most likely) related to how glib-networking is 
loaded at runtime (dlopen?) and thus static linkage is doomed to fail, 
though I have yet to prove this. Dynamic linking just works out of the 
box.

Cheers

Bernhard

On Wed, Oct 16, 2013 at 5:48 PM, Bernhard Schuster 
<schuster.bernhard@googlemail.com> wrote:
> Hi,
> 
> I am trying to cross compile a application which works just fine on 
> my x86_64 machine for a ARMv5TE "gadget". Unfortunately something 
> really weird happens: Altough having selected gnutls in order to use 
> TLS with glib-networking (GTlsConnection), I always get an error as 
> soon as the combined cert/key pem file is read (it exists, has proper 
> permissions, all tripple checked). The error always contains "TLS 
> unsupported" or "no TLS support" (can not recall, currently away from 
> that machine) altough the config.h of glib-networking says the 
> opposite. The binary is statically compiled (which worked fine so 
> far).
> 
> I am puzzled on how to fix my issue, I already tried to fix it by 
> adding a couple of commandline opts explicitly (though they say that 
> they are enabled by default, thus - as expected - nothing changed).
> 
> Also note that I have a similar issue with pcre (required for 
> GRegex), where I pass --enable-utf8 but it still did not fix anything.
> 
> Any help, hint, tip is appreciated.
> 
> Buildroot 2013.08 is used together with the code sourcery 2011/2013 
> toolchain
> 
> Best
> 
> Bernhard
> 
> 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131017/bdba5cb8/attachment.html>
