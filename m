From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 16 May 2015 00:22:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-12
In-Reply-To: <20150515215521.GB4216@free.fr>
References: <20150513063016.7B76D101561@stock.ovh.net>
 <20150515215521.GB4216@free.fr>
Message-ID: <5556719D.8040208@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 15/05/2015 23:55, Yann E. MORIN a ?crit :
> On 2015-05-13 08:30 +0200, Thomas Petazzoni spake thusly:
>>       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/f606ec1fff4cea257a4c6274bc5603efdfc439ad/
> 
> I can't reproduce this build failure here... :-/

Weird, I can reproduce it here:

/home/naourr/git/buildroot/test/ipmutils/host/usr/bin/i686-pc-linux-gnu-gcc  -g -O2 -o iseltime iseltime.o libipmiutil.a   -lpthread  ../lib/libipmi_lanplus.a -lcrypto 
libipmiutil.a(ipmilan.o): In function `hash':
/home/naourr/buildroot-test/test/ipmutils/build/ipmiutil-2.9.5/util/ipmilan.c:843: undefined reference to `md2_sum'
collect2: error: ld returned 1 exit status
make[3]: *** [ipmi_sample] Erreur 1
make[3]: *** Attente des t?ches non termin?es....
libipmiutil.a(ipmilan.o): In function `hash':
/home/naourr/buildroot-test/test/ipmutils/build/ipmiutil-2.9.5/util/ipmilan.c:843: undefined reference to `md2_sum'
collect2: error: ld returned 1 exit status
make[3]: *** [iseltime] Erreur 1

Best regards,
Romain

> 
> There's another similar one that happened today, which I'm also unable
> to reproduce:
>     http://autobuild.buildroot.org/results/aff/aff55e4714376197afaefa839fc1afe7a5aea748/
> 
> Regards,
> Yann E. MORIN.
> 
