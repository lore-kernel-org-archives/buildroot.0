From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jul 2017 18:20:56 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170710180949.764a0fdb@windsurf.lan>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
 <20170710180949.764a0fdb@windsurf.lan>
Message-ID: <20170710162056.GB3014@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-10 18:09 +0200, Thomas Petazzoni spake thusly:
> On Sun,  9 Jul 2017 11:29:59 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> > index 7eab0c25d6..3db10fc820 100644
> > --- a/package/kvm-unit-tests/Config.in
> > +++ b/package/kvm-unit-tests/Config.in
[--SNIP--]
> > @@ -28,3 +32,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
> >  	  features are submitted with accompanying unit tests.
> >  
> >  	  http://www.linux-kvm.org/page/KVM-unit-tests
> > +
> > +comment "kvm-unit-tests needs a toolchain w/ gcc >= 4.5"
> > +	depends on BR2_i386
> > +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> 
> What about the x86_64 dependency on a host compiler >= 4.5 ?

In the manual, it is said that one should not add a comment about a
dependency on the host toolchain...

> But those Config.in comments are not really related to the introduction
> of the _ARCH_SUPPORTS variable, so perhaps they should be in a separate
> patch.

Well, the comment did not exist previously indeed, but the dependency on
gcc did exist.

> If you don't want to respin but agree with what I said, just let
> me know, I can fixup when applying.

If you want to add this _one_ comment in a separate patch, I'm fine with
you splitting it.

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
