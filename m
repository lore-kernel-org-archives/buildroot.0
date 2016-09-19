From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Sep 2016 22:35:56 +0200
Subject: [Buildroot] Hint on switching between targets
In-Reply-To: <CAOMZO5BRPzX=cOpPJyH2ZmyxNhB6wu_EBFBm_DpcRz+Hd7MtKw@mail.gmail.com>
 (Fabio Estevam's message of "Fri, 9 Sep 2016 20:14:46 -0300")
References: <CAOMZO5BRPzX=cOpPJyH2ZmyxNhB6wu_EBFBm_DpcRz+Hd7MtKw@mail.gmail.com>
Message-ID: <87h99b630z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Hi,
 > My last Buildroot build was for warp7 target . Now I want to build for
 > wandboard, so I do

 > make wandboard_defconfig
 > make

 > ,but I get errors like

[snip]

 > I know I can do "make clean" and start from scratch, but I would like
 > to know if there is a minimal folder or something I can erase so that
 > the new build succeeds.

Do you mean that you would like to keep some of the already built
components when changing configuration? That isn't generally supported.
If you know what you are doing and the two configurations are
sufficiently similar (same arch/toolchain config) then it will work, but
Buildroot will not warn you if you do something that doesn't make sense.

If you just want to keep your warp7 output around while you build for
wandboard you can use out-of-tree builds - E.G.

make O=output-wandboard wandboard_defconfig
cd output-wandboard && make

-- 
Bye, Peter Korsgaard
