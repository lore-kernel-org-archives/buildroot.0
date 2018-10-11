From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2018 23:27:10 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
In-Reply-To: <20181011204808.1aff4cd1@windsurf>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-6-ricardo.martincoski@gmail.com>
 <20181011204808.1aff4cd1@windsurf>
Message-ID: <1adacc2a-25dc-eee5-8688-47ce66aa080b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/18 20:48, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 25 Sep 2018 23:55:14 -0300, Ricardo Martincoski wrote:
> 
>> +TEST_SCRIPT = """
>> +from twisted.internet import protocol, reactor, endpoints
>> +class F(protocol.Factory):
>> +    pass
>> +endpoints.serverFromString(reactor, "tcp:1234").listen(F())
>> +reactor.run()
>> +"""
> 
> At some point, we will have to find a solution to store such
> "artefacts" somewhere, instead of having them inline in their test
> cases. I don't have a good idea about this.

 I think it would be nice if we could add in the package directory a
subdirectory with files to be copied to the target for the runtime test, and a
python script for the test itself.

 As an in-between step, we can put the files-to-be-copied inside the
support/testing directory and explicitly enumerate the files-to-be-copied in the
test fixture.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
