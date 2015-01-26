From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 10:54:31 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
	QT_SHARED is not selected
In-Reply-To: <54C60A2A.9090805@gmail.com> (Richard Genoud's message of "Mon,
 26 Jan 2015 10:34:34 +0100")
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com>
 <87siey4i48.fsf@dell.be.48ers.dk> <54C60A2A.9090805@gmail.com>
Message-ID: <87lhkp3m08.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Genoud <richard.genoud@gmail.com> writes:

Hi,

>> I agree that it would be cleaner, but the reason the explicit QT_SHARED
 >> stuff was added was afaik a lot of systems only needed Qt in a single
 >> application / that application only used a subset of the Qt
 >> functionality, so having a static libQt while everything else was shared
 >> was quite a big win in size / startup time.

 > yes, that's exactly my case. I've got one single Qt application, and Qt
 > is quite huge, so making it static saves a lot of space.
 > I didn't trying to compile with BR2_STATIC_LIBS=y, but I guess that my
 > rootfs will be much bigger.

Indeed. I guess this is (still) quite common.


 >> It does complicate LGPL compliance and I don't know if the disk space
 >> concerns are as big these days though.
 >> 
 > Hum... I didn't think about the static vs dynamic LGPL compliance. I'll
 > have to check that.

I'm not a lawyer, but as I understand it - Because of the LGPLs
relinking requirements you basically have to provide the object files of
your application.

 > And for disk space concern, I must admit that I haven't got much space (
 > 60Mio for the rootfs, and the Qt application takes 10Mio

Heh, I've been involved with projects using Qt in <10MB ;)

-- 
Bye, Peter Korsgaard 
