From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sun, 29 Oct 2017 10:10:22 -0700
Subject: [Buildroot] [RFC 0/2] Add support for specifying a custom
 kernel directory
In-Reply-To: <20171029073312.GB2899@scaer>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <20171029073312.GB2899@scaer>
Message-ID: <5835fdce-74f9-eae0-6f2b-d851f08a408a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 10/29/2017 12:33 AM, Yann E. MORIN wrote:
> Florian, All,
> 
> On 2017-10-28 19:06 -0700, Florian Fainelli spake thusly:
>> This series allows specifying a custom kernel directory which could be an
>> existing git tree. This is particularly useful when doing kernel development
>> and having an existing git checkout where development is happening.
> 
> As I replied to the patch itself: this is already covered by the
> opverride-srcdir mechanism, so I've marked this series as rejected in
> our patchwork.
> 
>> Ideally, I would like to avoid doing the rsync operation involved with the "local" method
>> and instead just have a symbolic link from /path/to/kernel -> output/build/linux.
> 
> The first rsync may take a few seconds, true, but subs=equent ones will
> be much faster if all you do is change a few files, especially on a hot
> directory, so there is not much gain to have with a local symlink.

It is more about not duplicating sources unnecessarily. If you have all
developers on your system do the same thing, you would end-up with a lot
of copies of the same files, and if your filesystem does not already
offer de-duplication, that becomes additional space used. The copy
aspect is also potentially an issue since Linux kernel sources are
significant enough this can become a concern over time.

> 
> OTOH, I am currently working on out-of-tree per-pacakge build, which
> will (eventually) allow us to make use of the O= mechanism to build the
> kernel out-of-tree, and get rid of the rsync altogether. Don't hold your
> breath, though. ;-)

OK, that's good to hear. Feel free to CC when you get there and I will
happily try to test that too.

Thanks!
-- 
Florian
