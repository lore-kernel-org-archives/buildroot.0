From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 23 Feb 2018 08:05:02 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-02-21
In-Reply-To: <CAPi7W80DWG852ah5OeiYvqCdyFBvx_G3pGYo-D786P=OjVTjnQ@mail.gmail.com>
References: <20180222070010.882C22071A@mail.free-electrons.com>
 <CANQCQpZ4LfgTJakUKquxknPxepYKmoXoGGAztFwMEuBiw1nY7Q@mail.gmail.com>
 <CAPi7W80GcVM8JeM0Svzxb=AG=b2tJ59=QYArRWY6HkR9OjArGQ@mail.gmail.com>
 <CAPi7W80DWG852ah5OeiYvqCdyFBvx_G3pGYo-D786P=OjVTjnQ@mail.gmail.com>
Message-ID: <CANQCQpYuRiHF+AebVDW6H7a9nEgSfvST2jy2gDZFpHxdRPnkmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Fri, Feb 23, 2018 at 6:02 AM, Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
> Dear all,
>
> 2018-02-23 9:28 GMT+01:00 Fabrice Fontaine <fontaine.fabrice@gmail.com>:
>>
>> Dear Matthew,
>>
>>
>> 2018-02-22 23:41 GMT+01:00 Matthew Weber
>> <matthew.weber@rockwellcollins.com>:
>>>
>>> Thomas/Fabrice,
>>>
>>> On Thu, Feb 22, 2018 at 1:00 AM, Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>> > Hello,
>>> >
>>> > Build statistics for 2018-02-21
>>> > ===============================
>>> >
>>> >       branch |  OK | NOK | TIM | TOT |
>>> >       master | 172 |  28 |   0 | 200 |
>>> >    2017.11.x |  23 |   0 |   0 |  23 |
>>> >         next |  32 |  28 |   0 |  60 |
>>> >
>>> > Results for branch 'master'
>>> > ===========================
>>> >
>>> > Classification of failures by reason
>>> > ------------------------------------
>>> >
>>> >                   boost-1.66.0 | 6
>>>
>>> >         bfin |                   boost-1.66.0 | NOK |
>>> > http://autobuild.buildroot.net/results/ffa5f21d7e7c38ea7adebc84f1cc8ee4cff74f1b
>>> > |
>>> > microblazeel |                   boost-1.66.0 | NOK |
>>> > http://autobuild.buildroot.net/results/2879576eaa870eecd31af1ff9261df1b86966542
>>> > |
>>> >          arm |                   boost-1.66.0 | NOK |
>>> > http://autobuild.buildroot.net/results/a89df3195b44f125ba1797cf866f4a266909ec05
>>> > |
>>> >      powerpc |                   boost-1.66.0 | NOK |
>>> > http://autobuild.buildroot.net/results/c947986e4f460c1733c81585302f58baca84f01a
>>> > |
>>> >          arm |                   boost-1.66.0 | NOK |
>>> > http://autobuild.buildroot.net/results/679a12c04e9954947dd51df2017af561c362f8ec
>>> > |
>>> >         or1k |                   boost-1.66.0 | NOK |
>>> > http://autobuild.buildroot.net/results/4e901a97ad1c21f21e508eab8268374220f2eba3
>>> > |
>>>
>>> Similar to (https://patchwork.ozlabs.org/patch/871696/).  Feels like a
>>> similar patch is needed for Boost?  I don't have the history on the
>>> discussion for the domoticz pkg.
>>
>> You're right, this is the same issue. we should add a
>> BR2_TOOLCHAIN_HAS_THREADS_NPTL dependency to BR2_PACKAGE_BOOST_THREAD.
>> This dependency should be added to all packages using boost_thread
>> including domoticz. I can make this patch or let you do it if you want.
>
> After some investigations, it seems the issue was raised by azmq package
> which was missing a NPTL dependency. As a result, BR2_PACKAGE_BOOST_LOG was
> wrongly selected. I will send you a patch for azmq.
>>

All yours if you want to submit it, I can test.

Matt
