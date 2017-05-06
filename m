From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 6 May 2017 09:14:04 -0500
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <20170506145221.3db37159@free-electrons.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
 <CANQCQpYL-sL2xGKw==LAgEOSnoD_ULAaCtj=cb-KAFyM0ZJt4A@mail.gmail.com>
 <20170506145221.3db37159@free-electrons.com>
Message-ID: <CANQCQpZJPwwSoFVJ2DCU8tDn7OQPrPr02RABi1UgWwZmH=S8QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

On Sat, May 6, 2017 at 7:52 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 5 May 2017 17:11:08 -0500, Matthew Weber wrote:
>
>> > Matt, since this issue occurred on your autobuilder slave, could you
>> > indicate if you have done some maintenance / manually removed some
>> > downloaded files ?
>>
>> Let me check, I have 4 autobuilders setup to share the same archive folder.
>
> Why do you have such a setup? The autobuild-run script by itself is
> capable of running multiple slave instances at the same time, while
> making sure that each has its own download folder.

I had been running 4 instances on a virtual machine and had symlinked
the dl folders together to one.   This was mostly for space reasons
and I've since restored it to what you'd expect.

Here's the whole story....  I have modified the scripts to use a
Primary Site from an internal FTP because of proxy stability affecting
builds.  Secondly, the script is modified to look at a result for a
failing package and see if the build_end.log has a failure related to
our proxy or if it's a actual failure (for the case of a new package
not yet being on our internal FTP).  The last modification is to use
our mirror of buildroot which is 6hrs behind upstream.  This again is
proxy related and we had some failures because of timeouts to pulling
upstream.   I will take a look at my patchset and see if there maybe
should be some enhancements I push upstream.

>
>> > chmod +x /accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin
>> > chmod: changing permissions of '/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin': Operation not permitted
>> >
>> > Matthew: this is a configuration issue on your autobuilder slave. It is
>> > not normal that we are not allowed to set execution permissions. Could
>> > you fix this?
>>
>> Yep, I'll resolve this tonight.  Similar issue to above, I'm using a
>> cached folder for my builds and the autobuilder.  I''ll fix the
>> permissions and separate the dl folders from being shared.
>
> OK. Please just use the autobuild-run script as-is, and run a single
> invocation of the script. It can spawn multiple instances by itself, as
> said above.

Yep, that's how we do it.  Just had the symlinks as mentioned above.

<snip>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
