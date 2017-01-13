From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:11:52 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix build for sunxi targets
In-Reply-To: <20170113000428.4112-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Fri, 13 Jan 2017 01:04:28 +0100")
References: <20170113000428.4112-1-joerg.krause@embedded.rocks>
Message-ID: <874m13c7uv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Since version 2017.01 U-Boot needs to run the binman tool on the host machine
 > for building the 'u-boot-sunxi-with-spl.bin' target. The binman tool is written
 > in Python 2 so we need to add the python host package when building this
 > target, otherwise the build fails:

 > ```
 >   BINMAN  u-boot-sunxi-with-spl.bin
 >   File "./tools/binman/binman", line 49
 >     print result
 >                ^
 > SyntaxError: Missing parentheses in call to 'print'
 > make[1]: *** [Makefile:1090: u-boot-sunxi-with-spl.bin] Error 1
 > ```

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

That's not very nice :/

We already check for python on the build machine in dependencies.sh, so
perhaps we could patch the binman sources to be compatible with python
3 (and send the patch upstream)?

Is that something you could look into?

-- 
Bye, Peter Korsgaard
