From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 24 Jun 2013 08:07:56 -0400
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <20130624042824.GQ4824@tarshish>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130624042824.GQ4824@tarshish>
Message-ID: <CA+-urNS_evsGARC-Hm4CFM7OBkbfT7weyCnM3tpoxiRUxF-Pvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Mon, Jun 24, 2013 at 12:28 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Frank,
>
> On Sun, Jun 23, 2013 at 11:30:12PM -0400, Frank Hunleth wrote:
>> On Sun, Jun 23, 2013 at 7:13 PM, rh <richard_hubbe11@lavabit.com> wrote:
>> > On Sun, 23 Jun 2013 15:21:04 -0400
>> > Frank Hunleth
>> > <fhunleth@troodon-software.com> wrote:
>> >
>> > --8<--
>> >
>> >> However, copying the patches over to buildroot seems wrong and painful
>> >> to maintain, but as far as I can tell, there's no official/maintained
>> >> git repo with the beaglebone.org kernel patches.
>> >
>> > This seems official to me but not sure what you mean by official.
>> > Do you mean kernel.org-official?  TI-official? Circuitco?
>>
>> I'd just like to point to a kernel that is maintained and has the
>> features that I need. The one at github.com/beagleboard/kernel is the
>> obvious choice since that's what's shipped on the Beaglebone Black.
>>
>> The point of my email is just that the github.com/beagleboard/kernel
>> repository is not in a form that nicely integrates with buildroot due
>> to it just containing patches for a Linux kernel. I'm just looking for
>> pointers on how best to handle this.
>
> git integrates quite nicely with Buildroot, and a lot of packages fetch their
> sources from git repos. See the 'LIBFOO_SITE_METHOD' description in the
> Buildroot manual (http://buildroot.net/downloads/manual/manual.html). Also
> look for a github specific tip under 'Tips and tricks'.
>

Let me try asking my question again, since some of the details from
the original email have been trimmed.

Here's what root directory of the Beaglebone "kernel" git repo (3.8
branch) looks like:

configs/
hacks/
patches/
    6lowpan/
        0001-6lowpan-...
        <lots of patches>
    PG2
        0001-beaglebone-black-1ghz-hack.patch
    <lots of other directories with patches>
recipies/
patch.sh

The patch.sh script clones the Linus kernel and patches it when you run it.

Now, regarding Buildroot, there's an option for specifying the Linux
kernel via a git reference, but the expectation is that you'll be
getting Linux source code. There are also ways of applying patches to
a Linus kernel. The problem that I am trying to ask about is how best
to deal with the 600+ patches that are contained in beagleboard/kernel
patch tree.

Does this make more sense now?

Thanks,
Frank
