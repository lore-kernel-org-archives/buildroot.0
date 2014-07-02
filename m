From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 2 Jul 2014 18:27:21 +0200
Subject: [Buildroot] luna eclipse plugin
In-Reply-To: <20140701202532.5630a296@free-electrons.com>
References: <721AF07C74644451ADBDD65AA954043E@JohanW7>
 <20140701202532.5630a296@free-electrons.com>
Message-ID: <B3ED1E076F224BF8957D4B97F2FD4686@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


See below

-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: dinsdag 1 juli 2014 20:26
Aan: Sagaert Johan
CC: buildroot at busybox.net; 'M?lanie Bats'
Onderwerp: Re: luna eclipse plugin

Dear Sagaert Johan,

On Tue, 1 Jul 2014 20:14:05 +0200, Sagaert Johan wrote:

>  I tried the http://buildroot.org/downloads/eclipse/kepler-sr2/ plugin 
> in the current luna release and it seems to work, not sure if it may need some tweaking but this looks to work as required.

Thanks for your report. I know M?lanie has started working on rebuilding the Buildroot Eclipse plugin on top of Luna, so that it
uses the CDT version available with Luna rather than pulling an older version of CDT (if I understood correctly). There will be an
announcement on the mailing list when this update is available.

BTW, are you satisfied with the Eclipse plugin so far? Are there some additional features that you think would be useful to have?

Thanks for your feedback!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com

================================================================================
 
Dear ;

No real needs, but some things I noticed.
(Not sure if these are directly related to the plugin, or to eclipse itself.)

- When there has been a distclean done,(toolchain is missing) then it's not possible to open an
existing eclipse project. Eclipse even refuses to open or show the source files.

- after having run several buildroot builds with different toolchain settings (other gcc version )
  it may happen that eclipse complains about an invalid path.

Invalid project path: Include path not found
(/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.0/include-fixed).
Invalid project path: Include path not found
(/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.0/include).

 The solution to resolve this is to remove the .sc files under :
 <eclipse workspace dir>/.metadata/.plugins/org.eclipse.cdt.make.core/
The files seem to contain references to paths to gcc's of previous builds.

......snip ..........
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?scdStore version="2"?><scannerInfo id="org.eclipse.cdt.make.core.discoveredScannerInfo">
<instance
id="cdt.managedbuild.config.gnu.exe.debug.1347637552;cdt.managedbuild.config.gnu.exe.debug.1347637552.;org.buildroot.home.buildroot1
2git.output.c.compiler.282330785;org.buildroot.home.buildroot12git.output.c.input.869777988">
<collector id="org.eclipse.cdt.make.core.PerProjectSICollector">
<includePath path="/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/include"/>
<includePath path="/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/include-fixed"/>
<includePath
path="/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/../../../../arm-buildroot-linux-uclibcgnu
eabi/include"/>
<includePath path="/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.0/include"/>
<includePath path="/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.0/include-fixed"/>
<includePath
path="/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.0/../../../../arm-buildroot-linux-uclibcgnu
eabi/include"/>
<includePath path="/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include"/>
<definedSymbol symbol="__STDC__=1"/>
<definedSymbol symbol="__STDC_HOSTED__=1"/>
<definedSymbol symbol="__GNUC__=4"/>
<definedSymbol symbol="__GNUC_MINOR__=9"/>
......snip........

This has solved this problem in almost all cases.

Best regards, Johan
