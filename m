From: Christopher Reder <creder@digitalcpt.com>
Date: Wed, 16 May 2007 15:55:29 -0500
Subject: [Buildroot] libiconv
In-Reply-To: <20070516181623.GA20902@aon.at>
Message-ID: <011f01c797fc$89971080$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have searched around for a solution to the problem I have been having and
while there are a number of entries with the same issue, no one has a posted
solution.  I am using buildroot from svn with tiny-x server and metacity
enabled.  This will bring in gtk+ and other packages.  Without metacity and
those packages, everything compiles fine.  

When I add it in, I get the following error:

checking for iconv_open in -liconv... no
configure: error: *** No iconv() implementation found in C library or
libiconv
make: *** [/home/christopher/buildroot/build_arm/glib-2.12.9/.configured]
Error 1

and from config.log:


configure:5964: checking for iconv_open
configure:6020:
/home/christopher/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc
-$/tmp/cc06WWDf.o: In function `main':
conftest.c:(.text+0x4): undefined reference to `iconv_open'
collect2: ld returned 1 exit status
configure:6026: $? = 1

I have iconv installed and see iconv in /usr/local/bin .  can someone please
explain what is going on and what is wrong with this?  

Has anyone gotten something like this working for the arm (920T
architecture) ?

Christopher
