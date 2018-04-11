From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:48:26 +0200
Subject: [Buildroot] [PATCH] package/xterm: Avoid freetype2 path
 poisoning using imake
In-Reply-To: <20180327074434.15306-1-valentin.korenblit@smile.fr> (Valentin
 Korenblit's message of "Tue, 27 Mar 2018 09:44:34 +0200")
References: <20180327074434.15306-1-valentin.korenblit@smile.fr>
Message-ID: <87in8xzqut.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentin" == Valentin Korenblit <valentin.korenblit@smile.fr> writes:

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

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
