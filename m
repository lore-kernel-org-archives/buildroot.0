From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:19:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: Fix
 show-build-order stdout pollution
In-Reply-To: <20181115154542.29277-1-serj.kalichev@gmail.com> (Serj Kalichev's
 message of "Thu, 15 Nov 2018 18:45:42 +0300")
References: <20181115154542.29277-1-serj.kalichev@gmail.com>
Message-ID: <87woozx148.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Serj" == Serj Kalichev <serj.kalichev@gmail.com> writes:

 > The commands like  "make show-build-order" or "make <package>-show-build-order" show
 > the build order and then print "make[1]: Nothing to be done for 'show-build-order'" to
 > stdout. It pollutes output. Technically this message is true but it's not true for user
 > because he gets an information.

 > The <package>-show-build-order targets use $(info) for package name printing.
 > The make utility doesn't consider the internal directive as a command so it
 > think that it's "Nothing to be done". The patch adds the empty command to
 > <package>-show-build-order to inform make utility that taget makes some real
 > actions.

 > Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
