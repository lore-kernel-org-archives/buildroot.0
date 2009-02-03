From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Feb 2009 15:39:04 +0100
Subject: [Buildroot] Mysql error with Buildroot
In-Reply-To: <ce62e9d00901290036r3b7649e3s748b7821c7ab1f4b@mail.gmail.com>
	(Fabien Marteau's message of "Thu\, 29 Jan 2009 09\:36\:34 +0100")
References: <8ebba8c20901290015u199c2ad8r66ef36339ae1d099@mail.gmail.com>
	<ce62e9d00901290036r3b7649e3s748b7821c7ab1f4b@mail.gmail.com>
Message-ID: <87ocxjegaf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabien" == Fabien Marteau <lepingouin.tux@gmail.com> writes:

 Fabien> I has the same problem, to solve it I just made link on library :
 Fabien> cd /usr/lib
 Fabien> ln -s mysql/libmysqlclient.so.16

 Fabien> And it's work, but it's not very clean patch ;-)

The uclibc defconfig was set up to not respect RPATH settings, and
mysql used a RPATH to /usr/lib/mysql. Fixed in svn r25225.

-- 
Bye, Peter Korsgaard
