From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Mar 2018 07:46:04 -0500
Subject: [Buildroot] [PATCH] configs/freescale_p1025twr: needs
 host-openssl for the Linux kernel build
In-Reply-To: <a263d2ff-b184-e199-629c-e523ba026a02@mind.be>
References: <20180324142602.10995-1-thomas.petazzoni@bootlin.com>
 <CANQCQpZz5R1MkBEe2fxr9EsrTzsrzS55WPwbiTDq8W-wJS9snw@mail.gmail.com>
 <20180325212036.06226774@windsurf>
 <a263d2ff-b184-e199-629c-e523ba026a02@mind.be>
Message-ID: <CANQCQpYqkazq7OWEAKWY0mo_P_RXkhhXVCj4MRx+5xGnF_iaeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas,

On Mon, Mar 26, 2018 at 6:55 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 25-03-18 21:20, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sat, 24 Mar 2018 20:15:33 -0500, Matthew Weber wrote:
>>
>>>> Fixes:
>>>>
>>>>   https://gitlab.com/buildroot.org/buildroot/-/jobs/59015355
>>>
>>> Sorry, I didn't realize this failed.  Is there an automated email on
>>> this sort of failure?
>>
>> No, there isn't. Unfortunately, the Gitlab CI infra is not very
>> reliable, and a number of failures are not related to real problems in
>> Buildroot, but to Gitlab CI infrastructure problems.
>
>  Well, to be completely fair, it's not really the Gitlab CI infra which is
> unreliable. Rather, it's the free runners that are unreliable. I expect that if
> we would have a dedicated runner, we wouldn't see these problems. At least,
> that's how it looks to me (I'm not really an expert though).
>

Has anyone setup a Gitlab console/REST client?  We could build a
script on top of that which monitors the failed builds and does log
analysis (not sure what output our .gitlab-ci.yml is setup for
capturing).  Hopefully using that we could discard the bad jobs.  Then
we should be able to at least get the stage of failure from the API
too, which if each defconfig is a stage we could then map to
maintainer.  Similarly for the test cases....

If there isn't a console/REST client setup....
- Could we generate some test API keys for the Buildroot Gitlab instance?
- Do we have a spot we could run this script if someone was to develop it?


Matt
