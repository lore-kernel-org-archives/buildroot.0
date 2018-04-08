From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 17:06:02 +0200
Subject: [Buildroot] [git commit] package/xterm: Avoid freetype2 path
 poisoning using imake
In-Reply-To: <20180331205701.EC1E5815A5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 31 Mar 2018 22:56:46 +0200")
References: <20180331205701.EC1E5815A5@busybox.osuosl.org>
Message-ID: <87tvsld9gl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6d0316dc7b14f6cd2d44e92c6ab581a6ab385234
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When imake is installed on the host, it tries to include
 > freetype headers from host, so we must override ac_cv_path_IMAKE
 > to avoid this.

 > Extract from config.log:

 > configure:14803: checking if we should use imake to help
 > configure:14820: result: yes
 > configure:14829: checking for xmkmf
 > configure:14846: found /usr/bin/xmkmf
 > configure:14857: result: /usr/bin/xmkmf
 > configure:14920: testing Using /usr/bin/xmkmf  ...
 > configure:15015: testing IMAKE_CFLAGS  -I. -I/usr/include/freetype2

 > Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
 > [Thomas: pass ac_cv_path_IMAKE="" as suggested by Romain Naour.]
 > Reviewed-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
