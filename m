From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Apr 2009 08:11:04 +0200
Subject: [Buildroot] future of project support
In-Reply-To: <20090420003249.GA18066@cloud.net.au> (Hamish Moffatt's message
	of "Mon\, 20 Apr 2009 10\:32\:49 +1000")
References: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
	<877i1j9zcu.fsf@macbook.be.48ers.dk>
	<20090420003249.GA18066@cloud.net.au>
Message-ID: <877i1esfif.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> Because of the project stuff. There's been discussion about getting
 >> rid of that and simply use the external toolchain stuff if you want to
 >> build seperate rootfs'es for similar hw, and I'm seriously considering
 >> doing so.

 Hamish> I'm in favour of some simplification. Here's my usage:

 Hamish> I have a few related projects. I want to build them from the
 Hamish> same source tree. Ideally I can have them all built within
 Hamish> one check-out, so I can quickly make a change and test it in
 Hamish> multiple projects (without checking in, updating the other
 Hamish> check out etc).

Have you ever used the out-of-tree build feature? I use it all the
time, and it seems to fit this use case. Simply do make
O=/output/dir/for/project1 and all the build / binaries dirs gets in
/output/dir/for/project1.

 Hamish> I don't care if everything is rebuilt for each project.. (except the
 Hamish> toolchain possibly). I think the current mix of build_arch /
 Hamish> project_build_arch is a mess, I'd prefer to have everything in
 Hamish> project_build_arch really.

Or simply build_arch if we get rid of the project stuff.

-- 
Bye, Peter Korsgaard
