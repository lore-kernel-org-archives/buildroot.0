From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jun 2010 21:37:37 +0200
Subject: [Buildroot] [PATCH 1/4] bison: added host rules
In-Reply-To: <20100605213219.75765def@surf>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
	<1275761030-20955-2-git-send-email-llandwerlin@gmail.com>
	<20100605213219.75765def@surf>
Message-ID: <20100605213737.5b03517c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 5 Jun 2010 21:32:19 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Sorry, in fact, no. bison and flex are supposed to be installed on the
developer machine, as checked by toolchain/dependencies/dependencies.sh.

Therefore, for coherency, we should:

 * Remove the host-flex package;

 * Remove all the dependencies on host-flex (gob2, ipsec-tools, radvd,
   webkit)

Unless of course we decide not to have bison/flex as host requirements,
or if we need them for some reason (like building the package/config
lexer + parser), and still want to build our own versions for the
general case (so that we know which flex/bison versions are being used,
providing more guarantees over build success).

Whichever the decision is, it requires discussion.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
