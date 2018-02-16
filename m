From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Feb 2018 10:15:10 +0100
Subject: [Buildroot] Build error for lz4 package on x86-64 (buildroot
 2017.02.10)
In-Reply-To: <CAKH+9mwNZHORzcWssYX3fKeRCke7YN9xNPwZ4AMH9B-UZhmO-g@mail.gmail.com>
 (Tjeerd Bakker's message of "Fri, 16 Feb 2018 09:17:12 +0100")
References: <CAKH+9mwNZHORzcWssYX3fKeRCke7YN9xNPwZ4AMH9B-UZhmO-g@mail.gmail.com>
Message-ID: <87inaxl2ht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tjeerd" == Tjeerd Bakker <tjeerd.bakker38@gmail.com> writes:

 > Hi all,
 > Since the latest LTS release 2017.02.10, lz4 fails to build on x86-64, it
 > gives an include error for gnu/stubs-32.h. This is caused by commit
 > https://git.buildroot.org/buildroot/commit/?id=
 > 6f1c11f79a64387c1f1749550804f8aae0cfa7a7,
 > which causes lz4 to try to build 32 bit binaries because of the "all" make
 > target in the LZ4_BUILD_CMDS. Replacing the "all" target with "lib
 > lz4programs" fixes this. (Actually, this excludes the 'm32' target in
 > programs/Makefile).

Thanks for the heads up. Looking at the history, this is because that
commit was backported to 2017.02.x, but not the commit bumping the lz4
version to 1.7.5.

Looking at the r131 makefiles, it looks like the lz4programs target
doesn't build lz4c, which was the reason for the change - So perhaps a
better solution is to simply bump the lz4 version to 1.7.5?

 > I'm new to buildroot development. Should I create a patch in Patchwork, or
 > a pull request in Github?

We do not use github pull requests, so please send patches with
git-send-email to the mailing list (where they will be picked up by
patchwork) - Thanks!

-- 
Bye, Peter Korsgaard
