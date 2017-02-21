From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Feb 2017 08:51:15 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170220095957.ybz32ky73nnn4unu@ed>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219211718.42744cc8@free-electrons.com>
 <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
 <20170220094119.28e1827d@free-electrons.com>
 <20170220095246.ktazrkwdebnswnvv@ed> <20170220095957.ybz32ky73nnn4unu@ed>
Message-ID: <1f83e715-70b1-7dcd-2835-26b658144600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-02-17 10:59, Lionel Flandrin wrote:
> On Mon, Feb 20, 2017 at 10:52:46AM +0100, Lionel Flandrin wrote:
>> On Mon, Feb 20, 2017 at 09:41:19AM +0100, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Sun, 19 Feb 2017 22:20:54 +0100, Lionel Flandrin wrote:
>>>
>>>> Could we automate that somehow? Would simply importing the package be
>>>> sufficient for a basic runtime test? Alternatively could we run the
>>>> package-provided tests (if they exist)?
>>> The idea for this automation is what I've posted a few weeks ago:
>>>
>>>   http://lists.busybox.net/pipermail/buildroot/2017-February/183326.html
>>>
>>> It's a runtime testing infrastructure. For now, it only has a very
>>> small test for the Python interpreter itself, but we could very well
>>> have something that also tests Python packages.
> Erf, I completely missed that part of the email for some reason. I'll
> give those patches a test. Ideally we'd want to run the
> package-provided tests though, I'm not sure what would be the best way
> to do that.

 During previous discussions about testing in Buildroot it became clear that
there are many different kinds of tests. Running the package-provided tests is
one of them, but we don't consider it a priority. Indeed, if those tests fail,
it's a lot more likely that it is due to a bug in the package itself than due to
a bug in Buildroot (although obviously it's a very thin line between those two).
For Buildroot, the thing we need to test is: can it find all its runtime
dependencies (shared libs, Python modules it loads, programs it execs, ...). The
package test may or may not cover that, but running them is likely to take
relatively long. So we think the priority is to do a simple "check that it runs
at all" test.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
