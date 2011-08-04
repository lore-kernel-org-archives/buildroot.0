From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 08:21:15 +0200
Subject: [Buildroot] [Bug] alsamixer: can't load library 'libform.so.5'
In-Reply-To: <20110803182433.3dda34b1@gmail.com> (Frederic Bassaler's message
 of "Wed, 3 Aug 2011 18:24:33 +0200")
References: <20110803182433.3dda34b1@gmail.com>
Message-ID: <87ipqdpuhw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frederic" == Frederic Bassaler <frederic.bassaler@gmail.com> writes:

 Frederic> Hi, noticed this little bug right now :

 Frederic> alsamixer (from alsa-utils) complains that there's a missing
 Frederic> library on the generated system : 'libform.so.5', which is
 Frederic> normally part of ncurses.

 Frederic> the lib is generated in output/build/ncurses-5.7/lib/, but is
 Frederic> apparently not copied in output/target/usr/lib

Did you by any chance first build without alsamixer (but with ncurses),
and then later on reran make menuconfig / make to rebuild? If so,
ncurses doesn't get rebuilt / libforms doesn't get installed.

I just did a clean build here, and libform does get installed.

-- 
Bye, Peter Korsgaard
