From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 11:04:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-meson.mk: fix setting host
 C++ compiler
In-Reply-To: <20210323163051.1284416-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 23 Mar 2021 17:30:50 +0100")
References: <20210323163051.1284416-1-joerg.krause@embedded.rocks>
Message-ID: <87blav91tp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Commit f4a61d1ae23ec7729af3a8a165bbee45b6b9ef75 introduced CC_FOR_BUILD and
 > CXX_FOR_BUILD to avoid detecting ccache.

 > Both values are set to `HOSTCC`. This causes issues where C++ files are
 > compiled with the C compiler without passing the `stdc++` flag to the
 > linker, too.

 > Therefore, switch to pass the C++ compiler to CXX_FOR_BUILD.

 > Correctly fixes:
 > http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a

 > Commit 9783c04aaf5e4fc94099772f1dc699a974ee6538 proposed a fix which in
 > fact is a workaround to get Meson to pass the `stdc++` flag to the C
 > linker.

 > A fellow-up commit will revert this commit, as it is no longer
 > needed.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
