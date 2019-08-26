From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Aug 2019 11:36:53 +0200
Subject: [Buildroot] New search features on autobuild.buildroot.org
In-Reply-To: <20190826094933.5c5f2b5d@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 26 Aug 2019 09:49:33 +0200")
References: <20190820151106.4a1ffacf@windsurf.home>
 <87h86b7lyi.fsf@dell.be.48ers.dk>
 <20190826094933.5c5f2b5d@windsurf.home>
Message-ID: <87y2zg2rpm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter,
 > On Tue, 20 Aug 2019 20:04:05 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> One improvement could be to only pass the arguments if they have been
 >> filled in so you can ignore everything you don't care about rather than
 >> having to edit the URL afterwards.

 > Hm, this is exactly was it does, i.e if I do a search filtering only on
 > the architecture and one symbol, it redirects to the following URL:

 >   http://autobuild.buildroot.net/index.php?arch=arm&symbols%5BBR2_PACKAGE_STRACE%5D=y

 > This is all done by the submitForm() function in
 > http://autobuild.buildroot.net/search.js.

 > Could you confirm that it works for you (or not) ?

It doesn't (firefox-esr 60.8.0esr-1~deb9u1), it ends up redirecting to:

http://autobuild.buildroot.net/index.php?submitter=&reason=&arch=arm&subarch=&date%5Bfrom%5D=&symbols=BR2_PACKAGE_STRACE%3Dy&libc=&date%5Bto%5D=

Retrying on chrome I do see that it works:

http://autobuild.buildroot.org/index.php?arch=arm&symbols%5BBR2_PACKAGE_STRACE%5D=y

It would be great if we could get it to work under Firefox as
well. I know next to nothing about Javascript, but shouldn't the
submitForm() function take an event argument? In the debugger console I
see:

ReferenceError: event is not defined              search.js:3:5

-- 
Bye, Peter Korsgaard
