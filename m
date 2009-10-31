From: Marc Egli <marc.egli@hsr.ch>
Date: Sat, 31 Oct 2009 21:27:32 +0100
Subject: [Buildroot] wrong path in matchbox-desktop
Message-ID: <AACDBC45-AC19-4488-9921-427BFA3FC405@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-desktop fails with the following message:
/emb/buildroot/output/toolchain/bin/sed: can't read /usr/lib/ 
libxcb.la: No such file or directory
libtool: link: `/usr/lib/libxcb.la' is not a valid libtool archive
make[3]: *** [dotdesktop.la] Error 1
make[3]: Leaving directory `/emb/buildroot/output/build/matchbox- 
desktop-0.9.1/modules'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/emb/buildroot/output/build/matchbox- 
desktop-0.9.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/emb/buildroot/output/build/matchbox- 
desktop-0.9.1'
make: *** [/emb/buildroot/output/build/matchbox- 
desktop-0.9.1/.compiled] Error 2

i have a /emb/buildroot/output/build/stagingdir/usr/lib/libxcb.la but  
not in /usr/lib/

so i think it's a wrong path somewhere. i also made a symlink in /usr/ 
lib/ and now it builds without a problem. so i think there's something  
that need's to be fixed.

marc
