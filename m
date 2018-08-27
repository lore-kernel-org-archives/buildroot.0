From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 23:19:45 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <CAAXf6LUwdkE_DGPV88Xma5LqJkYpr=+0Xhyg50hFhnQXEhkmrw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 27 Aug 2018 23:01:18
 +0200")
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk> <20180815213421.08e0a3b6@windsurf>
 <87ftzf9v7u.fsf@dell.be.48ers.dk> <20180816001829.3f7a1436@windsurf>
 <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
 <20180816220655.37fbff34@windsurf>
 <CAAXf6LX52KbkJ3AHfvG4ZMZvRHtpcqUHfo98JeTjFnuWWfMWNg@mail.gmail.com>
 <CAAXf6LW1V3FLD8B=BQ=nGO3guTfR6Xsk2JtRFc5aei-ZP=hbcQ@mail.gmail.com>
 <CAAXf6LVAjPadPVB1Ubq_M=i1s8746fVAWNDvYm8dK_ZTBMbQgQ@mail.gmail.com>
 <87in3w9qjj.fsf@dell.be.48ers.dk> <20180827102815.23605ecd@windsurf>
 <87efek9ozo.fsf@dell.be.48ers.dk>
 <CAAXf6LUwdkE_DGPV88Xma5LqJkYpr=+0Xhyg50hFhnQXEhkmrw@mail.gmail.com>
Message-ID: <877ekb8q32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 > Backtrace from a quick gdb session:

 > Program received signal SIGABRT, Aborted.
 > 0x00007ffff7a4b010 in raise () from /lib64/libc.so.6
 > (gdb) bt
 > #0  0x00007ffff7a4b010 in raise () from /lib64/libc.so.6
 > #1  0x00007ffff7a4cc0d in abort () from /lib64/libc.so.6
 > #2  0x00007ffff7a427e7 in ?? () from /lib64/libc.so.6
 > #3  0x00007ffff7a428a2 in __assert_fail () from /lib64/libc.so.6
 > #4  0x0000555555560a6f in propval_cell ()
 > #5  0x000055555555b536 in check_graph_child_address ()
 > #6  0x0000555555558dc8 in check_nodes_props ()
 > #7  0x0000555555558df6 in check_nodes_props ()
 > #8  0x000055555555a4d7 in run_check ()
 > #9  0x000055555555c2cf in process_checks ()
 > #10 0x0000555555558797 in main ()

 > I haven't dug deeper. It could be that some patching is needed in
 > host-dtc itself, to solve the above error.

Thanks for investigating. This again seems to confirm that reverting the
dtc bump will be a solution for 2018.08.

-- 
Bye, Peter Korsgaard
