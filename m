From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Tue, 25 Nov 2008 15:15:17 +0300
Subject: [Buildroot] =?windows-1251?q?=D1orrect_buildroot/target/jffs2/jff?=
	=?windows-1251?q?s2root=2Emk=2E?=
Message-ID: <260427672.1227615317.177933076.67883@mcgi54.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

I will speak about .../buildroot/target/jffs2/jffs2root.mk file.

I had built JFFS2 image for MIPSel and found that there is an indefinite 
conduct of the 'rmdir' (linux remove directory utility).

An error consists of that command:

@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share

does not delete directory recursive and reports error of that (I have 
Ubuntu-8.04 host machine).

So I decided this problem by means of substituting of this line:
@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
by it:
@rm -r $(TARGET_DIR)/usr/share

And it works!

--
Andrew
