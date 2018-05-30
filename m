From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 18:45:28 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180530153119.GA2592@scaer>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
 <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
 <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
 <1fdbacbd-e80f-8735-89c8-2ca92224ee9a@mind.be> <20180509202254.GA9837@scaer>
 <871sdu9akm.fsf@dell.be.48ers.dk> <20180530153119.GA2592@scaer>
Message-ID: <c55c7a49-77e9-f174-5c90-c8baa950d7da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-05-18 17:31, Yann E. MORIN wrote:
> Peter, All,
> 
> On 2018-05-29 09:37 +0200, Peter Korsgaard spake thusly:
>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>  >> Would you like to prepare a patch introducing the python-based approach? It
>>  >> should be two patches: the first one introducing the python script in mkusers,
>>  >> the second one removing the mkpasswd package.
>>
>>  > Sorry, I am not too convinced that writing our own tool is good...

 If I understand correctly, you don't want to write our own tool because "don't
roll your own security"...

>>
>> Me neither. Another alternative is to build host-busybox and use the
>> mkpasswd applet with the built in crypt routines (ENABLE_USE_BB_CRYPT).
> 
> Yeah, I like that idea more. Plus, we can get known-reproducible
> behaviour for other applets, should we need to add that.

 ... and you'd rather replace it with the busybox implementation that uses a
homegrown hash of getpid() + monotonic_us() as the salt?

 The whois stuff at least uses /dev/urandom to generate the salt...

 Or maybe that was your point, eliminate randomness to get known-reproducible
behaviour?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
