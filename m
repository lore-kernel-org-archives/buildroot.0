From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 14 Aug 2012 09:47:50 -0400
Subject: [Buildroot] Suggestion: increase username buffer size in busybox
	login
Message-ID: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Would anybody object to increase the size of the username buffer that
busybox login has:

loginutils/login.c, line 37

enum {
	TIMEOUT = 60,
	EMPTY_USERNAME_COUNT = 10,
	USERNAME_SIZE = 32,
	TTYNAME_SIZE = 32,
};

I would like to submit a patch to increase USERNAME_SIZE to 256.

My rationale is (disclaimer: mainly influenced by my own
buildroot-based project): now that we have PAM in place, more
interesting login schemes are possible such as authentication against
some remote host/domain which asks for usernames like user at host or
user at domain (or domain\user).

Where did the size 32 come from?

Or would it be better to raise this with busybox developers?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
