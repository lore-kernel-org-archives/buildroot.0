From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 21 Nov 2017 18:21:26 +0100
Subject: [Buildroot] [PATCH v4 1/2] libkrb5: New package
In-Reply-To: <20171121135622.033678af@windsurf.lan>
References: <1511213549-1878-1-git-send-email-nerv@dawncrow.de>
 <20171121135622.033678af@windsurf.lan>
Message-ID: <2a42b590-14f0-9fff-dfd5-31f021c5cbae@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.11.2017 um 13:56 schrieb Thomas Petazzoni:
> Hello,
> 
> Thanks for this new iteration. Much better without the
> configure.ac patch.
> 
> On Mon, 20 Nov 2017 22:32:28 +0100, Andr? Hentschel wrote:
> 
>> +LIBKRB5_VERSION = 1.15.2
>> +LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/1.15
>> +LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
>> +LIBKRB5_SUBDIR = src
>> +LIBKRB5_LICENSE = MIT
>> +LIBKRB5_LICENSE_FILES = NOTICE
>> +LIBKRB5_INSTALL_STAGING = YES
>> +LIBKRB5_AUTORECONF = YES
> 
> Are you sure you still need to AUTORECONF the package? Now that the
> configure.ac patch is gone, I don't think this is necessary anymore.
> 
>> +# Add sane assumptions about cross-compiling
> 
> Rather than "sane assumptions", a clearer comment would be: "The
> configure script uses AC_TRY_RUN tests to check for those values, which
> doesn't work in a cross-compilation scenario. Therefore, we feed the
> configure script with the correct answer for those tests". Or something
> along those lines.
> 
> Note: both issues can be fixed when applying, no need to resend just
> for that.

Yes, thanks for taking care!
The autoreconf isn't needed anymore, I just tested it.
