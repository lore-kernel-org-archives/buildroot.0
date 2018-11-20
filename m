From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 23:20:19 +0100
Subject: [Buildroot] [PATCH next v2] tpm2-tss: depend on shared libraries
In-Reply-To: <20181120101402.4123-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Tue, 20 Nov 2018 08:14:02 -0200")
References: <20181120101402.4123-1-casantos@datacom.com.br>
Message-ID: <87k1l7o0gs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > The code includes dlfcn.h even if --enable-static and --disable-shared
 > are passed to configure. There is an "#ifndef NO_DL ... #endif" wrapper
 > but NO_DL is never defined and adding "-DNO_DL" to CFLAGS causes other
 > compilation errors.

 > Fixes:
 >   http://autobuild.buildroot.net/results/cfc3bfef5e93329bf944a57947086d9ddc4fece3

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Supersedes: https://patchwork.ozlabs.org/patch/999631/
 > ---
 > Changes v1->v2:
 > - propagate this dependency to the reverse dependencies of tpm2-tss.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
