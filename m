From: Yair Ben Avraham <yairba@tkos.co.il>
Date: Tue, 19 Dec 2017 16:20:08 +0200 (IST)
Subject: [Buildroot] [PATCH v2 1/1] tpm-tools: bump to version 1.3.9.1
In-Reply-To: <20171219134547.70fae97f@windsurf>
References: <1513679676-17188-1-git-send-email-yairba@tkos.co.il>
 <20171219134547.70fae97f@windsurf>
Message-ID: <alpine.DEB.2.20.1712191514250.3246@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 19 Dec 2017, Thomas Petazzoni wrote:
> On Tue, 19 Dec 2017 12:34:36 +0200, Yair Ben Avraham wrote:
>
>>  - Revert to pkcs11 support. Building src/data_mgmt directory depends on
>>    P11_SUPPORT which in turn depends on opencryptoki/pkcs11.h header and it's
>>    not a make issue
>
> I don't understand this part however. Could you explain a bit more ?
> What do you mean by "it's not a make issue" ?

In commit 4ef0ef3 "tpm-tools: new package", the pkcs11 support explicitly 
disabled due to "... it is not handled by tpm-tools.mk currently."

The building of src/data_mgmt commands, which enable the pkcs11 support 
(see ./configure file), depends on the P11_SUPPORT flag (see 
src/Makefile.am) which in turn depends on opencryptoki/pkcs11.h header 
(see ./configure.ac file).

So the reason that pkcs11 is not supported it's not because that 
tpm-tools.mk not handle it, but because of the lack of 
opencryptoki/pkcs11.h header.

By "it's not a make issue" I mean "not handled by tpm-tools.mk".

Thanks,
Yair
--
Yair Ben-Avraham
Tk Open Systems Ltd.
052-343-2297
yairba at tkos.co.il
