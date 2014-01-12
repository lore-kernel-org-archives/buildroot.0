From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 21:32:59 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <20140112200937.GC3374@free.fr> (Yann E. MORIN's message of "Sun, 
 12 Jan 2014 21:09:37 +0100")
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
 <20140112183442.GB3374@free.fr> <8738kt3t5f.fsf@dell.be.48ers.dk>
 <20140112200937.GC3374@free.fr>
Message-ID: <87lhyl2b5w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > An third alternative is to add a package/pkg/pkg.hash file, which
 > contains the list of files, and their hashes; in fact, the output of the
 > hash util we'd use:
 >     ABCDEF1234567890  foo-1.2.3.patch
 >     ABCDEF1234567890  bla.patch
 >     ABCDEF1234567890  file.bin

That sounds good to me, and is easy to handle. Another alternative would
be to make <pkg>_CHECKSUM a list of hashes, in the same order as the
files are handled (_SOURCE, _EXTRA_DOWNLOADS, _PATCH).


 > Also, we'd have to settle for a hash function. md5 is outdated and
 > subject to attacks; sha1 is still current, but there are known potential
 > attacks; sha2/256 is still very strong for the foreseeable future;
 > sha2/512 seems like a bit overkill, although the time to hash is not
 > very different between sha2/256 and sha2/512.

 > This can be very easily changed, so I've settled for sha2/256 for now.

Next to their strength is also the issue about how likely it is that
those tools are available on the build host. As we would like to check
the hash before downloading, it wouldn't work very well if we needed to
build a host-sha2 or similar.

I don't know what's available on E.G. RHEL, but perhaps sha1 is a safer
bet?

-- 
Bye, Peter Korsgaard
