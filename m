From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 11:51:57 +0200
Subject: [Buildroot] build error since a change in apply-patches.sh
In-Reply-To: <9F3B5AF9F17649E5A569DE606814A046@JohanW7> (Sagaert Johan's
 message of "Mon, 16 Sep 2013 11:34:36 +0200")
References: <9F3B5AF9F17649E5A569DE606814A046@JohanW7>
Message-ID: <87y56xgkle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Build error

 Sagaert> ........
 >>>> liblockfile 1.08 Extracting
 Sagaert> gzip -d -c /home/johan/dl/liblockfile_1.08.orig.tar.gz | tar --strip-components=1 -C
 Sagaert> /home/buildroot12git/output/build/liblockfile-1.08  -xf -
 >>>> liblockfile 1.08 Patching package//liblockfile
 Sagaert> support/scripts/apply-patches.sh /home/buildroot12git/output/build/liblockfile-1.08 /home/johan/dl liblockfile_1.08-4.debian.tar.bz2
 Sagaert> Unsupported format file for
 Sagaert> /home/buildroot12git/output/build/liblockfile-1.08/.patches-liblockfile_1.08-4.debian.tar.bz2-unpacked/debian/changelog
 Sagaert> make: *** [/home/buildroot12git/output/build/liblockfile-1.08/.stamp_patched] Error 1


 Sagaert> I think something is not right in commit d245fbb41dc148a956df59658cc0dc1262612e09 
 Sagaert> ( apply-patches.sh: detect missing patches)

Yes, I already brough this up here:

http://lists.busybox.net/pipermail/buildroot/2013-September/078292.html

I guess the best option is just to go back to warn on non-patches.

-- 
Bye, Peter Korsgaard
