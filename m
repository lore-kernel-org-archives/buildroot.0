From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 2 Dec 2011 15:21:46 -0000
Subject: [Buildroot] 2011.11 zlib headers problem?
In-Reply-To: <20111202155801.57d914a5@skate>
References: <2DEA474F53884F0AA751ABAD42769383@beraninstruments.com.local>
 <DAC204EF7EE84F359328546B86282CFD@beraninstruments.com.local>
 <20111202131728.77b8c6ee@skate>
 <E06240F532254AA9BA06ECC0B98E6A19@beraninstruments.com.local>
 <20111202155801.57d914a5@skate>
Message-ID: <FE09BD4FCAD14686B66A8A283A22426C@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Thomas Petazzoni
> Sent: 02 December 2011 14:58
> 
> Le Fri, 2 Dec 2011 13:50:28 -0000,
> "Will Moore" <will.moore@beraninstruments.com> a ?crit :
> 
> > > Can you post the Buildroot .config you use to reproduce the problem?
> >
> > See attached.
> 
> Interestingly, here, the build fails when building gdbhost:
> 
> configure: creating ./config.status
> config.status: creating Makefile
> ./config.status: line 1123: gawk: command not found
> config.status: creating testsuite/Makefile
> ./config.status: line 1123: gawk: command not found
> config.status: creating config.h
> ./config.status: line 1149: gawk: command not found
> config.status: error: could not create config.h
> make[3]: *** [configure-libiberty] Error 1
> make[2]: *** [all] Error 2
> make[1]: *** [/home/test/outputs/will/toolchain/gdbhost-7.3.1/gdb/gdb]
> Error 2
> 
> (Note: gawk is not available on my build machine, but has been built as
> a dependency of ct-ng. I guess the gdbhost build process misses
> $(HOST_DIR)/usr/bin in its PATH).

Thanks for trying that.

Builds for me ;) but then I have gawk installed on my host regardless of the
gawk built as a dependency of ct-ng.

> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
