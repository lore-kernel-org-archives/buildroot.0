From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:56:33 +0200
Subject: [Buildroot] [PATCH 1/4] python-pycryptodomex: new package
In-Reply-To: <20180922193631.14369-1-asafka7@gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
Message-ID: <20181009155633.2ad54938@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 22:36:28 +0300, Asaf Kahlon wrote:
> Cryptographic library for Python
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Let's add some license experts in the loop.

> +PYTHON_PYCRYPTODOMEX_LICENSE = Apache-2.0

I am not sure this is an accurate description of the license terms.
Reading https://pycryptodome.readthedocs.io/en/latest/src/license.html
(which is the same as the LICENSE.rst you use as a license file), it
says:

"""
The source code in PyCryptodome is partially in the public domain and
partially released under the BSD 2-Clause license.
"""

There is also the text of the Apache 2.0 license, but it doesn't say to
which part of the code it applies.

And there is a special constraint for the OCB cipher, that it cannot be
used for military purposes. I am not sure how Debian accepts that, but
they do accept it:
https://metadata.ftp-master.debian.org/changelogs/main/p/pycryptodome/pycryptodome_3.6.1-2_copyright.

Yann, Arnout, I'm interested by your opinion on this package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
