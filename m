From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 22:08:27 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <20140112210111.GD3374@free.fr> (Yann E. MORIN's message of "Sun, 
 12 Jan 2014 22:01:12 +0100")
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
 <20140112183442.GB3374@free.fr> <8738kt3t5f.fsf@dell.be.48ers.dk>
 <20140112200937.GC3374@free.fr> <87lhyl2b5w.fsf@dell.be.48ers.dk>
 <20140112210111.GD3374@free.fr>
Message-ID: <87d2jw3o38.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > And how do you suggest we correlate the hash from that list to the file
 > we're actually just downloaded?

 > The tarball is in one variable, the patches in a second, and the extra
 > files in a third.

 > We'd have to look in each of those variables to find the file, and
 > derive an offset in the list form that, and then extract the n-th
 > element of that list.

 > I guess this is not so easy as you think it is. ;-)

I guess not ;) As I said, a seperate <pkg>.hash is OK as well.


 >> > Also, we'd have to settle for a hash function.
 > [--SNIP--]
 >> Next to their strength is also the issue about how likely it is that
 >> those tools are available on the build host.

 > Right, those pesky companies using "Enterprise Editions" and then stuck
 > back in the 20th century... ;-]

Indeed.

 > sha1 shall it be, then. ;-)

 > (Note: sha2 was added to coreutils seven years ago, 2005-10-23)

Ahh, ok - I didn't realize it was that old.

From a quick look, it seems like it's even present in RHEL5, which is
probably as old as we can sanely support (are people really still using
RHEL4 for development?):

http://rpmfind.net//linux/RPM/centos/5.10/i386/CentOS/coreutils-5.97-34.el5_8.1.i386.html

-- 
Bye, Peter Korsgaard
