From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 21:30:02 +0200
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <20170722144552.GE9929@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
 <e1b95878-e58f-c884-4265-8a1dcae14583@mind.be>
 <20170722144552.GE9929@scaer>
Message-ID: <20170722213002.14ee6db9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jul 2017 16:45:52 +0200, Yann E. MORIN wrote:

> >  PEP8 says snake-case for functions. I'm not sure if the rest of the testing
> > infra satisfies this, but let's try to not make things worse.  
> 
> We already have BRTest.setUp() and BRTest.tearDown(), so I mimicked
> that. And I also applied Thomas suggestion to go camel-case with
> functions (reviewed on IRC).

I don't think I said to use camel case for functions. What I said is to
not use ThisIsAFunction for functions/methods, because that's normally
used for classes.

> >     def test_run(self):
> >         self.startEmulator(self.fs_type())
> >         self.checkInit(self.init_path())
> >         if self.have_network():
> >             self.checkNetwork("eth0")
> >         else:
> >             self.checkNetwork("eth0", 1)
> > 
> >  Ideally you'd then make this an ABC class and declare those callbacks as
> > @abstractmethod, but perhaps that's going too far for you :-)  
> 
> Is it really necessary that we go this route? It is much more complex,
> for a dubious gain, if at all.
> 
> I'd prefer we keep with simple, plain code, so that everyone can
> contribute more easily...

Fully agreed with Yann. I know there are lots of funky but useful
constructs / features in Python, but I'd like to keep the testing
infrastructure to a usage of Python that can reasonably be understood
by the average C programmer. So, a good indicator is: do Yann and
Thomas understand what it does? If the answer is no, the construct
shouldn't be used :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
