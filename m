From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Sep 2019 09:35:34 +0200
Subject: [Buildroot] [PATCH v4 2/5] autobuild-run: initial
 implementation of get_reproducibility_failure_reason()
In-Reply-To: <20190909004223.24aaed8f@windsurf>
References: <20190820145231.15507-1-itsatharva@gmail.com>
 <20190820145231.15507-2-itsatharva@gmail.com>
 <c73a2826-6935-169b-fe2a-836848b225e3@mind.be>
 <20190909004223.24aaed8f@windsurf>
Message-ID: <211178c1-904d-6c32-9ebf-098e3e53db34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/09/2019 00:42, Thomas Petazzoni wrote:
> On Sun, 8 Sep 2019 19:06:11 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> +                    if "version" in package_info[package]:
>>> +                        version = package_info[package]["version"]
>>> +                        return [package, version]  
>>
>>  I don't know how useful it is to extract the package version... It is currently
>> part of the reason file mostly by accident, I think.
> 
> I find it quite useful to have the version in the failure reason.
> Thanks to that, when you search with ?reason=foo%, you can see
> immediately in the list which versions of the package are/were affected
> by a failure.

 Yes, but:

1. I really think it is there by accident :-)

2. For reproducibility failures, I don't think it is that relevant.

In case a failure was introduced by a version bump, you anyway have to check by
hand when the version was bumped to be sure that that is really the cause.

 Regards,
 Arnout
