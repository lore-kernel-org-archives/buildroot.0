From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Sun, 10 Apr 2011 17:07:46 +0200
Subject: [Buildroot] [SOLVED] [Xorg-Server] [GL] No package 'gl' found
 (kinda solved)
In-Reply-To: <1302246406.4891.131.camel@esp-patben-lin.espdx1.local>
References: <1302246406.4891.131.camel@esp-patben-lin.espdx1.local>
Message-ID: <1302448066.4891.179.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dnia 2011-04-08, pi? o godzinie 09:06 +0200, Patryk Benderz pisze:
> Hi List,
> During configuration of xorg-server I got:
> 
> >>> xserver_xorg-server 1.7.5 Configuring
> [...]
> checking for GL... configure: error: Package requirements (glproto >= 1.4.9 gl >= 7.1.0) were not met:
> No package 'gl' found
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> Alternatively, you may set the environment variables GL_CFLAGS
> and GL_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> I have checked, and glproto is selected in BR as version 1.4.10. Any
> hints which BR config option is responsible for GL?

After searching the web a lot I found some information [1] that this gl
is a library contained as an example in Mesa. I have deleted mesa build
directory to make clean compilation. It occur that mesa has difficulties
to compile. I was desperate to compile this ASAP, thus I tried different
versions of Mesa. Some newer versions complained about missing 'talloc'
package which  I couldn't find, and some had some syntax errors. Finally
I have downgraded Mesa to 7.6. This version worked fine with 2011-03-31
BR snapshot and let me compile whole system.
	I hope that one day, this will save someone some time of searching for
solution...
-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
