From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Jul 2015 12:06:17 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <55AF6B19.7010702@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

Le 22/07/2015 09:43, Thomas Petazzoni a ?crit :
> Hello,
> 
> Brendan, Alexey, Clayton, Gustavo, J?rg, Guillaume, Marcin, Waldemar,
> Nicolas, Bernd, Johan, R?mi, Paul, Max,Samuel, Vicente, Yegor, Yann,
> please have a look below. Some of the build failures need your
> help/attention. Thanks!
> 

[snip]

>>          arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/58d3d2605337fe1ce49d333cb712941711276100/
> 
> Weird C++ problem:
> 
>   error: 'template<class T, class A> std::size_t cppcms_boost::hash_value' conflicts with a previous declaration
> 
> Nicolas, you are the original submitter of cppcms, can you have a look?

Nicolas is working on it.

> 
>>          arm |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/d81fe547227ffcbd270f2a00beb572755ab668f6/
> 
> Discussed in http://patchwork.ozlabs.org/patch/473622/.
> 

Sorry, I haven't reworked on it after Peter's reply...

> 
>>       x86_64 |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
> 
> Another uClibc static linking problem. Waldemar?
> 

Waldemar, I think you can skip this issue since I'm working on the efl bump to
the latest release and I had to disable the efl package for uClibc-ng.

I had a link issue:
lib/eina/.libs/libeina.so: undefined reference to `mkstemps'
It turn out that mkstemps and mkostemps are not available in uClibc-ng.

> 
>>       xtensa |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/a15c8b5cf90935e42d4605f7f95ff1814c94254c/
>>      powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f444ab04da5423db032bc12824da5f577156e957/
>>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/bf6b9bcc0cead87c8fb12ec4c7f5ff73e6d61d3f/
>>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/881f1e09ad3ba0c62f04349764446d4436a28781/
> 
> Some should be fixed by http://patchwork.ozlabs.org/patch/495849/, but
> definitely not all of them. Samuel, since is package is CMake based,
> can you have a look?
> 

I've looked at it yesterday, and qpid-proton should be disabled for static only
build since it want to build unconditionally a shared library "libqpid-proton.so"

Also host-swig dependency seems missing.

Best regards,
Romain
> 
> Thanks,
> 
> Thomas
> 
