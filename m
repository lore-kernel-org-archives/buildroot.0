From: Thomas Ehrhardt <tehrhardt@innovaphone.com>
Date: Thu, 26 Jul 2018 03:44:29 -0500 (CDT)
Subject: [Buildroot] ghostscript: wrong fonts path set in target
 application
In-Reply-To: <20180725163732.66eb4956@windsurf>
References: <1532519188355-0.post@n4.nabble.com>
 <20180725163732.66eb4956@windsurf>
Message-ID: <1532594669999-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

in the ghostscript-fonts package the variable is set too:
GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/gs

On the target system the call ghostscript -h shows something like this:
Search path:
[..]
/[..]/output/target/usr/share/fonts/gs

This is a wrong fonts search directory compiled within ghostscript, I think
correct is /usr/share/fonts

Regards
Thomas




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
