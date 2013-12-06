From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 08:36:43 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <20131205234122.GH3405@free.fr>
References: <20131206002526.58d095e8@skate>
	<20131205234122.GH3405@free.fr>
Message-ID: <CAAXf6LVnoGgnwYNS+iqGdqpwdB+XoDC2Z0iCTKz2wxuKZbSYWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Dec 6, 2013 at 12:41 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2013-12-06 00:25 +0100, Thomas Petazzoni spake thusly:
>> Due to the autobuild.buildroot.org server crash, I had to quickly set
>> up a new instance, which didn't include the build results available
>> from the old server.
>>
>> I'm happy to announce that I have now reimported the old build results
>> in the new server. This means that:
>>
>>  1/ All previous autobuild.buildroot.org URLs of build results should
>>     now work again.
>>
>>  2/ The graph of success vs. failure rate is a lot more useful, see
>>     http://autobuild.buildroot.org/stats.php.
>
> There is something striking about this graph: the month before releases,
> we clearly see a trend that the ratio success/failure increases in
> favour of sucess, and suddenly there is a dramatic reversal the moment
> the release is made, ie. when next is merged back into master.
>
> That means we're doing quite a good job at hunting the failures during
> the feature-freeze: this cycle, the ratio was ~90% success / ~10% failures
> at the time of release. This is pretty good. :-)
>
> As for the sudden drop at the time next is merged, I don't know what to
> think of it.

I am thinking of two ways to help reduce this problem:

1. During the time -next is opened (until release) we also make test
builds on that branch (but keep the results separate from the master
results, of course).
Pros:
  - better visibility on the quality of -next, before it is being
merged, and a chance to fix the problem beforehand
Cons:
  - attention of developers is diverted away from stabilizing the
upcoming release
  - autobuild computing capacity is diverted away too


2. Similar, in a way: when patches are posted to the list (not only
during the stabilization month), run them through some autobuild
configurations 'automatically' to try catching common problems (for
example thread support, mmu support, uclibc problems, ...) and post
the results somewhere. This generates a kind of 'staging moment' for
patches before they get applied, to check their quality.
Whether this should be done for all patches (even at their initial
send) or only makes sense for patches that have been reviewed first
(to make sure the computing power is used usefully) is something that
can be discussed. In the latter case, we'd need to have a trigger to
request the test builds.
The results would ideally be added to patchwork, next to the requested
'Acked-by' indication, giving the maintainer a better idea of the
quality of a patch, before merging it.
This is very much related to the continuous integration server idea of
Jerome, except that it should be done on patches not-yet-merged into
git.
Pros:
  - quality of master (as measured by the normal autobuilders) should
go up because many problems are fixed beforehand
Cons:
  - need computing power for these extra tests, but this is not unsurmountable


Best regards,
Thomas
