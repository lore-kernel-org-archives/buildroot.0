From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 16 Sep 2007 00:27:26 +0200
Subject: [Buildroot] svn commit: trunk/uClibc: ldso/include
	ldso/ldso/sparc	libc/string etc...
In-Reply-To: <f43fc5580709151241g578c4ce8i85d956039a747958@mail.gmail.com>
References: <20070915075059.68EC4A6056@busybox.net>
	<20070915121916.GK20058@aon.at>
	<f43fc5580709150607t4e51b73by878a54e35da00750@mail.gmail.com>
	<20070915192154.GL20058@aon.at>
	<f43fc5580709151241g578c4ce8i85d956039a747958@mail.gmail.com>
Message-ID: <20070915222726.GN20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 15, 2007 at 10:41:51PM +0300, Blue Swirl wrote:

>> >> Blue Swirl, please let me know if that's correct and useable now.
>> >
>> >The CPU selection could be improved so that for Sparc64, only the
>> >following are valid:
>> >config BR2_sparc_v9
>> >config BR2_sparc_ultrasparc
>> >config BR2_sparc_ultrasparc3
>> >config BR2_sparc_niagara
>>
>> Ok, will do.
>>
>> >I'm not so sure about removing those from Sparc(32) options, because
>> >then we could not build a 32-bit environment for V9 CPU.
>>
>> In uClibc, we have v7, v8, v9, v9b (?).
>> What is the relation between insn-set/insn scheduler for these:
>> sparclite:      f930, f934, sparclite86x
>> sparclet:       tsc701
>> Are these all v8 (for uClibc)?
>
>These are v7 (sparc32, early 1990s), the difference between v7 and v8
>is that a few more instructions (div, mul) are implemented in hardware
>in v8. I think kernel emulates the missing instructions (with a speed
>penalty).
>
>> And what is v9b? An extended insn set or just v9 with a different
>> scheduling?
>
>V9 plus VIS (much like MMX) instructions, like falignaddr and
>aligndata used in libc/string/sparc/sparc64/memcpy.S. That by the way
>makes it difficult to target plain V9...
>
>> >I'm just trying a native build, looks like the compiler options build
>> >are not correct, there is -mcpu=v7 flag even though I selected v9.
>>
>> Sounds odd, i'll look into this.
>>
>
>Sorry, I think it was "k7" for cross compile host in the other window, not v7.

Ok. I've split sparc64 from sparc, added a pseudo v9b that turns on
-mvis, made sure that configuring uClibc picks up the correct type.
Please holler if i made something wrong or if you need additional bits..

cheers,
Bernhard
