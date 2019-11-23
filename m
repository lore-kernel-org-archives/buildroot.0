From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 13:34:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: make default port and
 lock directory config options
In-Reply-To: <20191123110346.GT32494@scaer> (Yann E. MORIN's message of "Sat, 
 23 Nov 2019 12:03:46 +0100")
References: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
 <20191123110346.GT32494@scaer>
Message-ID: <87r21yydnz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > James, All,
 > On 2019-11-21 15:30 +0000, James Byrne spake thusly:
 >> Minicom's configure script will set values for the default port and lock
 >> directory based on the configuration of the host machine, which is not
 >> useful for cross-compiling, so make them config options that can be set
 >> to suit the target system.

 > Thnks for this patch.

 > However I wonder if it makes sense to have those configurable at all.

My thought exactly.

 > The man page of minicom states, for the lock dir, that it default to
 > /var/lock on Linux ("GNU/Linux systems use /var/lock"), so we should
 > probably set that. The user can provide an override in a system-wide
 > config file (in /etc/minicom/).

 > Also, I think we should just set the default port (aka device in minicom
 > terminology) do /dev/ttyS1, as written in the man page ("/dev/tty1 or
 > /dev/ttyS1 for most people"). Ditto, users may override that with a
 > system-wide config file.

I wonder if ttyS0 wouldn't be a more sensible default. But ok, if you use
/dev/ttyS0 for the Linux console, then ttyS1 is probably indeed a good
default.

-- 
Bye, Peter Korsgaard
