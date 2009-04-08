From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Apr 2009 15:02:27 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <980CE415-4586-46DB-ABA4-D6962163D0C6@cannasoftware.com> (Lloyd
	Sargent's message of "Tue\, 7 Apr 2009 10\:57\:40 -0500")
References: <20090407083540.15437e75@surf>
	<980CE415-4586-46DB-ABA4-D6962163D0C6@cannasoftware.com>
Message-ID: <871vs31eos.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lloyd" == Lloyd Sargent <lloyd@cannasoftware.com> writes:

 Lloyd> I ran into this issue as well and ""lzo/lzo1.h not found" is terribly
 Lloyd> confusing. Adding just "on host" to the end of the message would
 Lloyd> clarify it immensely.

Notice that this is not an error message we're writing, but an error
message from configure/gcc.

Anyway, the real fix is to build lzo for the host before mkfs.jffs2,
just like we do for the target.

-- 
Bye, Peter Korsgaard
