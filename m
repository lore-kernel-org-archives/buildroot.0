From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 20:47:54 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <XnsA60BD392F6F5FID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160517153611.2a3b4199 at free-electrons.com: 

>>          arm |                      vlc-2.2.3 | NOK |
>>          http://autobuild.buildroot.net/results/1a7893c13f6144e0ecd9f37f
>>          2f047c596ccedd35/ 
> 
> ld: cannot find -lGL
> 
> Bernd?

should be fixed by http://patchwork.ozlabs.org/patch/623236/

VLC has no switch for detecting OpenGL support and searches only for gl.pc

http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blob;f=configure.ac;h=e021546e
284d7daefdb4d94f430eb0bc57722210;hb=HEAD#l3079

which needs to be removed by the mesa3d package when OpenGL is not
available. 

Regards, Bernd
