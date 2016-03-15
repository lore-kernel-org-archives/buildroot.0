From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:15:42 +0100
Subject: [Buildroot] [PATCH v2 1/2] gcc: preserve CXXFLAGS_FOR_TARGET
In-Reply-To: <1457840717-10596-2-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Sun, 13 Mar 2016 06:45:16 +0300")
References: <1457840717-10596-1-git-send-email-jcmvbkbc@gmail.com>
 <1457840717-10596-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87h9g775gx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > gcc-4.7.x, gcc-4.8.x and gcc-4.9.x don't propagate CXXFLAGS_FOR_TARGET to
 > CXXFLAGS for libstdc++ build. As a result libstdc++ is built without
 > TARGET_CFLAGS and may fail to link with applications using it, see e.g.

 >   http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/

 > Instead of passing TARGET_ABI or TARGET_CFLAGS for libstdc++ in
 > --enable-cxx-flags parameter backport the patch that fixes propagation
 > of CXXFLAGS_FOR_TARGET to CXXFLAGS.

 > This issue is fixed in gcc-5.x

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v1->v2:
 > - backport to 4.7.x as well;
 > - mention that the issue is fixed in 5.x

Committed, thanks.

-- 
Bye, Peter Korsgaard
