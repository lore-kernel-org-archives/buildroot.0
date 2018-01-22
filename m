From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Jan 2018 22:57:13 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20180119090315.1fd13958@windsurf.lan>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home> <20171228175256.GA24806@ned>
 <20171228223629.0fd45695@windsurf> <20180118074850.GA10580@itchy>
 <20180118090319.3d32c593@windsurf.lan> <20180118224158.GA24327@itchy>
 <20180119090315.1fd13958@windsurf.lan>
Message-ID: <a3a4a451-864a-f77c-d41f-04afd9ae641a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-01-18 09:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 18 Jan 2018 23:41:58 +0100, Eric Le Bihan wrote:
> 
>>> We have tests like support/testing/tests/fs/test_iso9660.py that don't
>>> use BASIC_TOOLCHAIN_CONFIG.
>>
>> Looking at the existing tests, I thought it was a requirement to use
>> toolchains hosted at http://autobuild.buildroot.org/.
> 
> Not at all. We do have some tests that don't use those toolchains. Look
> at support/testing/tests/boot/test_atf.py, the tests use Linaro
> toolchains.
> 
>>> I'm not sure what "artefacts" you are looking for here.  
>>
>> I was referring to ARTIFACTS_URL, where ARM versatile/vexpress
>> kernels are available. As I thought I should have used
>> br-aarch64-glibc-2017.05-1078-g95b1dae.tar.bz2 to get a glibc-based
>> toolchain, adding Aarch64 support to the emulator seemed necessary.
>>
>> I'll go with the Linaro toolchain, using ARM vexpress as target.
> 
> If you want to do runtime test on an AArch64 platform without building
> the kernel as part of your test configuration, then yes, we would have
> to add an artifact on http://autobuild.buildroot.net/artefacts/. I can
> definitely do that if needed.
> 
> I'm not super happy with this artefacts solution, but I wanted to avoid
> putting all those binary files under version control inside the
> Buildroot repository. If people have better proposals, I'm definitely
> interested.

 We could have the artefacts produced by gitlab-CI, and use the gitlab pipeline
feature to make sure the most recently built one is used. Well, that's the
theory, I haven't looked at the details :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
