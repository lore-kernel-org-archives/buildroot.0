From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 21:53:38 +0200
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <20170722144552.GE9929@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
 <e1b95878-e58f-c884-4265-8a1dcae14583@mind.be> <20170722144552.GE9929@scaer>
Message-ID: <26a88450-f1cb-a870-136a-936f0e5c9ec7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-07-17 16:45, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-07-22 16:32 +0200, Arnout Vandecappelle spake thusly:
>>  I think this patch should go in right away, even before the skeleton/systemd
>> fixes. Yes, that may make some tests fail, but that's fine.
> 
> I am not so sure. We don;t know how long it will take this series to get
> in in its entirety.
> 
> OTOH, ahving the tests in right now would be quite an incentive to get
> the rest in. ;-]

 Well, we already have two tests failing and nobody seems to fix them...

[snip]
>>> +    def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
>>
>>  PEP8 says snake-case for functions. I'm not sure if the rest of the testing
>> infra satisfies this, but let's try to not make things worse.
> 
> We already have BRTest.setUp() and BRTest.tearDown(), so I mimicked
> that.

 Well, that's because python unittest predates PEP8 and it already had these
names, so they couldn't be changed.


 There are two tools, pep8 and flake8, that help checking PEP8 compliance.

[snip]
>>  These you could also run automatically, and request the arguments from the
>> instance:
>>
>>     def test_run(self):
>>         self.startEmulator(self.fs_type())
>>         self.checkInit(self.init_path())
>>         if self.have_network():
>>             self.checkNetwork("eth0")
>>         else:
>>             self.checkNetwork("eth0", 1)
>>
>>  Ideally you'd then make this an ABC class and declare those callbacks as
>> @abstractmethod, but perhaps that's going too far for you :-)
> 
> Is it really necessary that we go this route? It is much more complex,
> for a dubious gain, if at all.

 That's why I said "ideally".

 The callbacks (or they could be class members as well, like we have with
config) are indeed useful I think.


> I'd prefer we keep with simple, plain code, so that everyone can
> contribute more easily...

 Fair enough.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
