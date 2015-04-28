From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 11:42:12 +0200
Subject: [Buildroot] [PATCH RESEND] qt: add QT_COORD_TYPE to double
	option
In-Reply-To: <1429691658-13139-1-git-send-email-richard.genoud@gmail.com>
 (Richard Genoud's message of "Wed, 22 Apr 2015 10:34:18 +0200")
References: <1421750951-28114-1-git-send-email-richard.genoud@gmail.com>
 <1429691658-13139-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <874mo0zj0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Genoud <richard.genoud@gmail.com> writes:

 > From: Julien D'Ascenzio <jdascenzio@paratronic.fr>
 > On ARM-based platforms, qreal is a typedef for float for performance
 > reasons.
 > But we may want a double precision anyway.

 > Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
 > ---
 > Rebased and compiled on master (21 april 2015) for arm926ej-s

This causes compilation issues with the test module as it defines a
template using double and one using qreal:

http://autobuild.buildroot.net/?reason=qt-4.8.6

Care to take a look and send a fix?

-- 
Bye, Peter Korsgaard
