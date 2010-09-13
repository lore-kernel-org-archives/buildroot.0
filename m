From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Sep 2010 23:19:14 +0200
Subject: [Buildroot] Build error "cannot find -lc"
In-Reply-To: <20100913194702.51831574@surf> (Thomas Petazzoni's message of
	"Mon, 13 Sep 2010 19:47:02 +0200")
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>
	<20100911105201.176d1396@surf>
	<KAW101-W3400321E421A55939E3C979B750@phx.gbl>
	<KAW101-W44BEAE1114E33C6DD47BD39B770@phx.gbl>
	<20100913194702.51831574@surf>
Message-ID: <87d3sh7359.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Tue, 14 Sep 2010 02:37:22 +0900
 Thomas> S W <sw18@hotmail.co.jp> wrote:

 >> I checked the /lib and /usr/lib, but I couldn't find 
 >> glibc.a file. 
 >> So I did "yum install glibc-static" to install the libc.a file.
 >> Now it is OK with this problem.

 Thomas> Ok, thanks.

 Thomas> Peter, what can we do about this ? Should we enforce the fact that
 Thomas> glibc-static is installed globally ? Or just if host-module-init-tools
 Thomas> is going to be compiled ?

Globally I would say. host-module-init-tools probably isn't the only
package that might want to link something statically.

Perhaps we could simply try to compile (statically) && run something
like:

int main(void) { return 0; }

in dependencies.mk and error out if it fails.

-- 
Bye, Peter Korsgaard
