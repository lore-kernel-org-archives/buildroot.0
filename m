From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Dec 2008 14:32:43 +0100
Subject: [Buildroot] hotplug lsof index libssp
In-Reply-To: <6c8937b20812162350r1d6aea89jc784100c7151b274@mail.gmail.com> (l.
	m.'s message of "Wed\, 17 Dec 2008 15\:50\:52 +0800")
References: <6c8937b20812162140u6138e517n87fe31e24e82b7ba@mail.gmail.com>
	<20081217064519.GA23637@cloud.net.au>
	<6c8937b20812162350r1d6aea89jc784100c7151b274@mail.gmail.com>
Message-ID: <878wqf2ah0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "l" == l m <lmmmcc@gmail.com> writes:

Hi,

 >> Bytes. Is it this diethotplug-0.5.tar in r24435 corrupted?

 l>     Yes it is. Thanks, I fixed it in r24436.

Yeah, my fault.

 >> 2. lsof
 >> The default lsof site ftp://lsof.itap.purdue.edu is not valid now. I use

 l>     ? It looks ok to me.

 l> ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.81.tar.bz2 Can you
 l> download this link? This is the wget result.
 
 l> " wget ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.81.tar.bz2
 l> --2008-12-17 15:48:46--  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 l> lsof_4.81.tar.bz2
 l>            => `lsof_4.81.tar.bz2'
 l> Resolving lsof.itap.purdue.edu... 128.210.7.20
 l> Connecting to lsof.itap.purdue.edu|128.210.7.20|:21... connected.
 l> Logging in as anonymous ...
 l> Error in server greeting.
 l> Retrying."
 
It seems like your reverse dns is broken. From http://people.freebsd.org/~abe/:

!!!NOTICE!!! The ftpd server of the host, lsof.itap.purdue.edu, where
   the lsof tar files reside MUST be able to convert (do a DNS
   reverse-lookup of) the Internet address of the host from which an
   attempt is being made to "get" the lsof tar file, and then it must
   be able to convert (do a DNS forward lookup of) that host name and
   find the host's starting Internet address.

There's not much we can do about it. If you can get it from somewhere
else you can stick it in your download directory and buildroot won't
try to download it any more.

 >> 3. index() function
 >> Some packages still use index(), but default setting doesn't support it.

 l>     Which packages?
 
 l> I only tried tinylogin and syslogd.

Ahh, any reason you cannot use the busybox versions? tinyloging is
deprecated.

-- 
Bye, Peter Korsgaard
