From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Apr 2013 22:54:50 +0200
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <1366919482310-44235.post@n4.nabble.com> (thomas's message of
 "Thu, 25 Apr 2013 12:51:22 -0700 (PDT)")
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
 <1366918894609-44233.post@n4.nabble.com>
 <87ip3a9yzi.fsf@dell.be.48ers.dk>
 <1366919482310-44235.post@n4.nabble.com>
Message-ID: <871u9y9vqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "thomas" == thomas  <thomas.spitz@gmail.com> writes:

 thomas> Hello Peter,
 thomas> As I wrote, I'm not using dropbear anymore but openssh alone.

 thomas> Here below my simple test:
 thomas> thomas at thomas-laptop:~/Armadeus/armadeus-5.2$ sftp root at 192.168.1.5
 thomas> root at 192.168.1.5's password: 
 thomas> sh: /usr/libexec/sftp-server: not found
 thomas> Connection closed

 thomas> Effectively, I have no /usr/libexec/sftp-server folder on my
 thomas> target. Openssh didn't create it... Is there something manual
 thomas> to do in order to activate sftp?

Hmm, indeed. A quick test shows:

make openssh
..
/usr/bin/install -c -m 0755  sftp-server /home/peko/source/buildroot/output/target/usr/lib/sftp-server
..

I guess it's because we're explicitly passing
--with-libexecdir=/usr/lib. With that removed I see:

/usr/bin/install -c -m 0755  sftp-server /home/peko/source/buildroot/output/target/usr/libexec/sftp-server

Fixed in git, thanks for the report.


-- 
Bye, Peter Korsgaard
