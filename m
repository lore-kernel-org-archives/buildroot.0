From: Chris Smith <chris.smith@tandberg.com>
Date: Wed, 29 Jul 2009 09:06:39 +0100
Subject: [Buildroot] Problem using netsnmp
In-Reply-To: <87y6q8jyz1.fsf@macbook.be.48ers.dk>
References: <4A6EE8F1.3060302@tandberg.com>
	<87y6q8jyz1.fsf@macbook.be.48ers.dk>
Message-ID: <4A70030F.9080007@tandberg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry that should have been libc.so.6.

Building for i486.

I noticed that snmpd is the only thing in the makefile using MAKE1 to 
build and that it is the only binary with a problem.

readelf shows
 0x00000001 (NEEDED)                     Shared library: 
[libnetsnmpagent.so.15]
 0x00000001 (NEEDED)                     Shared library: 
[libnetsnmphelpers.so.15]
 0x00000001 (NEEDED)                     Shared library: 
[libnetsnmpmibs.so.15]
 0x00000001 (NEEDED)                     Shared library: [libnetsnmp.so.15]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: 
[libcrypto.so.0.9.8]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Which looks ok to me. But on the target...

/usr/sbin/snmpd: can't load library 'libc.so.6'


Peter Korsgaard wrote:
>>>>>> "Chris" == Chris Smith <chris.smith@tandberg.com> writes:
>>>>>>             
>
> hi,
>
>  Chris> When I build netsnmp the built snmpd doesn't work on the
>  Chris> target.  All the other snmp stuff works but I get lib.so.6 not
>  Chris> found when trying to run snmpd.
>
> Sure that's 'lib.so.6'? That's a fairly strange library name.
>
>  Chris> Anyone have any thoughts?  It is as if some linkage to host
>  Chris> based libraries has crept in.
>
> What arch are you building for?
>
> What does build_*/staging_dir/*-readelf -x <snmpd> | grep NEEDED give?
>
>   


-- 

--------------------------------------------------------------------
TANDBERG Telecom UK Ltd
Registered in England and Wales No: 3390345. 
Registered address: 
Unit 2 Pine Trees, Chertsey Lane, Staines, Middlesex, TW18 3HR
