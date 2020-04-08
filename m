From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 16:34:27 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gcc: pass -Wno-error to
 debug builds
In-Reply-To: <20200407192622.46151-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 7 Apr 2020 13:26:22 -0600")
References: <20200407192622.46151-1-james.hilliard1@gmail.com>
Message-ID: <87d08ihwr0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Fixes:
 > ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
 >    return S_ISLNK (st.st_mode);
 >                      ^
 > Upstream has been unable to reproduce/fix properly, details:
 > https://gcc.gnu.org/legacy-ml/gcc-patches/2019-03/threads.html#00827

 > Upstream recommends passing -Wno-error as a workaround, see:
 > https://gcc.gnu.org/pipermail/gcc-patches/2019-April/519867.html

 > Reviewed-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - add more details to message
 > Changes v1 -> v2:
 >   - add comment from Yocto recipes

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
