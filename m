From: Will Newton <will.newton@gmail.com>
Date: Wed, 28 Mar 2012 13:47:58 +0100
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
	$(HOST_DIR)/opt/perl
In-Reply-To: <20120328125547.6873d986@skate>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 <87fwctb4gn.fsf@macbook.be.48ers.dk>
 <20120328095532.71abc612@skate>
 <87bonhax4p.fsf@macbook.be.48ers.dk>
 <CAFbHwiQUZKJeD-F2z_EnPC=QE-FhuRDb3bZUenEjmprJE6MPGw@mail.gmail.com>
 <20120328125547.6873d986@skate>
Message-ID: <CAFbHwiSNFMApHiihk+C1tN+cX1DENBbnZrkoOiPKEMhiHeSOyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 28, 2012 at 11:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 28 Mar 2012 11:40:00 +0100,
> Will Newton <will.newton@gmail.com> a ?crit :
>
>> Do you think that setting LD_LIBRARY_PATH in the way I suggested is
>> unsafe? I had some concerns that it might affect the search path for
>> libraries but I believe this is not an issue with a cross linker
>> (according to the ld man page, I haven't checked the code), and it
>> does not break any of the test builds I have done.
>
> In the past, we had the problem that when we were building target
> packages that required host utilities installed in $(HOST_DIR)/usr/bin,
> those utilities were not able to find their libraries in
> $(HOST_DIR)/usr/lib. We tried using LD_LIBRARY_PATH, but libtool used
> it as the search path for libraries when compiling target stuff. So, we
> decided to hardcode the correct rpath in all binaries built and
> installed in $(HOST_DIR)/usr/bin.
>
> So, yes, I believe that adding LD_LIBRARY_PATH is going to cause
> problems, unless those problems have disappeared for some other reason.
>
> See:
>
> ?c1b6242fdcf2cff7ebf09fec4cc1be58963e8427
> ?0d1830b07db4ebfd14e77a258de6fb391e57e960
> ?6b939d40f6a29a43277566adc9d4312d49cb3abf
>
> For a history of what we tried on this topic.

If ld handles this explicitly and correctly then this sounds like a
libtool bug to me. Do you have a testcase that can reproduce it? I
have spent some time trying to make libtool break but without success,
but I am far from an expert in that area...
