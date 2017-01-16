From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 16 Jan 2017 21:04:27 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix build for sunxi targets
In-Reply-To: <874m13c7uv.fsf@dell.be.48ers.dk>
References: <20170113000428.4112-1-joerg.krause@embedded.rocks>
 <874m13c7uv.fsf@dell.be.48ers.dk>
Message-ID: <1484597067.8221.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, 2017-01-13 at 16:11 +0100, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> ?> Since version 2017.01 U-Boot needs to run the binman tool on the
> host machine
> ?> for building the 'u-boot-sunxi-with-spl.bin' target. The binman
> tool is written
> ?> in Python 2 so we need to add the python host package when
> building this
> ?> target, otherwise the build fails:
> 
> ?> ```
> ?>???BINMAN??u-boot-sunxi-with-spl.bin
> ?>???File "./tools/binman/binman", line 49
> ?>?????print result
> ?>????????????????^
> ?> SyntaxError: Missing parentheses in call to 'print'
> ?> make[1]: *** [Makefile:1090: u-boot-sunxi-with-spl.bin] Error 1
> ?> ```
> 
> ?> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> That's not very nice :/
> 
> We already check for python on the build machine in dependencies.sh,
> so
> perhaps we could patch the binman sources to be compatible with
> python
> 3 (and send the patch upstream)?
> 
> Is that something you could look into?

I would rather not do the porting, but I can ask upstream about
supporting Python 3.

J?rg
