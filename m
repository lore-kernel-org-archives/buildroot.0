From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 19:35:19 +0100
Subject: [Buildroot] [PATCH 0/6] [RFC] Adds test infrastructure for
 packages
In-Reply-To: <2109934542.250678.1441612831227.JavaMail.zimbra@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
 <55ECC243.4010307@mind.be>
 <2109934542.250678.1441612831227.JavaMail.zimbra@openwide.fr>
Message-ID: <56117167.1070305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 09:00, Denis Thulin wrote:
> Hi Arnout,
> 
> ----- Le 7 Sep 15, ? 0:46, Arnout Vandecappelle arnout at mind.be a ?crit :
> 
>> Hi Denis,
>>
>> On 31-08-15 11:59, Denis THULIN wrote:
>>> This patch series adds a test generation infrastructure for packages to
>>> Buildroot.
>>> The generated tests are robotframework tests.
[snip]
>> Bottom line: I'm not in favour of this series either. Of course, the first
>> patch adding python-robotframework is still relevant independently.
> 
> Ok, thanks for the answer  :)

 Hi Denis,

 We discussed this again at the BR Developer meeting in Dublin, and concluded
that we're going to proceed with the simpler and less-invasive unit-test-based
approach. It is in fact already running on Jenkins at [1]. Therefore, I've
marked most of the series as Rejected in patchwork.

 Regarding python-robotframework, as mentioned before, it is still relevant.
However, neither of the two versions you submitted are suitable at the moment:
- the version of [2] is still using 2.9rc1;
- the version of [3] add a host- version which we don't need.
Note that the host-version was not even needed in this series: for something
like this, we expect it to be installed on the system rather than building it.
So these patches are both marked as Changes Requested.

 Regards,
 Arnout

[1] http://jenkins.free-electrons.com/job/buildroot-runtime-tests/
[2] http://patchwork.ozlabs.org/patch/501203/
[3] http://patchwork.ozlabs.org/patch/512420/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
