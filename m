From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 11 Feb 2016 12:56:24 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/1] protobuf: fix detection of __atomic_*()
 built-ins
In-Reply-To: <56BB96D0.4040901@mind.be>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
 <56BB96D0.4040901@mind.be>
Message-ID: <1398182074.2143009.1455202584606.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "thomas petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Wednesday, February 10, 2016 6:00:16 PM
> Subject: Re: [Buildroot] [PATCH 1/1] protobuf: fix detection of __atomic_*() built-ins

> On 10-02-16 16:33, Carlos Santos wrote:
> [snip]
>> +#
>> +# On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
>> +# types are available built-in. However, the __atomic_*() built-ins for
>> +# 8-byte types is implemented via libatomic, so only available since gcc
>> +# 4.8.
>> +#
>> +# In Buildroot, to simplify things, we've decided to simply require gcc
>> +# 4.8 as soon as the architectures has at least one __atomic_*() built-in
>> +# variant that requires libatomic.
>> +#
>> +# Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
>> +# *could* technically build with gcc 4.7. This is probably not a big deal,
>> +# and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
>> +#
>>  # host-protobuf only builds on certain architectures
>>  config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>>  	bool
>> -	default y if BR2_arm
>> -	default y if BR2_i386
>> -	default y if BR2_mipsel
>> -	default y if BR2_x86_64
> 
> Sorry for my confusion, but why do you remove these? It will still work with
> gcc 4.7 on arm, i386, mipsel and x86_64 because it will use its custom atomic
> implementation, no?

Ok, I will restore the prevoius defaults, allowing protobuf to build with gcc < 4.8.

Carlos Santos (Casantos)
DATACOM, P&D
