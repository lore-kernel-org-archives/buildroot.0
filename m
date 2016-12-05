From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2016 18:26:00 +0100
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <5840ddaed472e_3050f36d441751b@ultri3.mail>
References: <7b4bc8b4-db76-7703-54ce-72d923c00a41@mind.be>
 <5840ddaed472e_3050f36d441751b@ultri3.mail>
Message-ID: <8f2315e4-1622-ce45-991d-81382ffd503f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-12-16 03:34, Ricardo Martincoski wrote:
[snip]
>>> +    def check_tarball_exists(self, expected_download):
>>> +        if self.verbose:
>>> +            os.system('echo -n "dl: " ; ls package/package/dl/')
>>> +        return os.path.isfile('package/package/dl/package-' + expected_download + '.tar.gz')
>>  It would be good to also check the contents of the tarball. That way the
>> submodule stuff is immediately covered as well.
> Indeed. This is the only one I am not sure how I will do in the test infra, but
> should not be too hard. I will keep this suggestion in mind when rewriting the
> tests.

 Here's a hint:

	import tarfile
	with tarfile.open(expected_download) as tf:
		files = tf.getnames()
		...

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
