From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 15:44:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] tpm-tools: bump to version 1.3.9.1
In-Reply-To: <alpine.DEB.2.20.1712191514250.3246@localhost>
References: <1513679676-17188-1-git-send-email-yairba@tkos.co.il>
 <20171219134547.70fae97f@windsurf>
 <alpine.DEB.2.20.1712191514250.3246@localhost>
Message-ID: <20171219154418.24a00bc9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Dec 2017 16:20:08 +0200 (IST), Yair Ben Avraham wrote:

> In commit 4ef0ef3 "tpm-tools: new package", the pkcs11 support explicitly 
> disabled due to "... it is not handled by tpm-tools.mk currently."
> 
> The building of src/data_mgmt commands, which enable the pkcs11 support 
> (see ./configure file), depends on the P11_SUPPORT flag (see 
> src/Makefile.am) which in turn depends on opencryptoki/pkcs11.h header 
> (see ./configure.ac file).
> 
> So the reason that pkcs11 is not supported it's not because that 
> tpm-tools.mk not handle it, but because of the lack of 
> opencryptoki/pkcs11.h header.

And so?

The reason why tpm-tools.mk explicitly disables it is because we
generally try to explicitly disable features that are not handled by
Buildroot. I.e if package A needs package B to enable a given feature,
then Buildroot passes --disable-B in order to be sure that the
configure script will not mistakenly enable it (some configure scripts
are for example confused by host-installed libraries and headers).

So, I'm sorry, but your explanation doesn't make much sense to me. So
either I still don't understand what you mean, or you did not
understand why --disable-pkcs11-support was originally added.

If nothing provides opencryptoki/pkcs11.h, then this option should
continue to be explicitly disabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
