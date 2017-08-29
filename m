From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Aug 2017 22:26:59 +0800
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
In-Reply-To: <CAEUhbmWiyHVrHdXED1nQV4Lm3JLgwmDNAUr3HiAfOMD+hLAP6A@mail.gmail.com>
References: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
 <20170824193354.782bae38@windsurf>
 <CANQCQpY+iyQ5XtTA5tCh9V9awNa4fhGzJ+bmBdY1YWODuxjppQ@mail.gmail.com>
 <20170824230211.4c0ea814@windsurf>
 <CANQCQpY3p9GK58EE1weGjnJ1H-YwALk5nrSUQvG-UwF4RczWkw@mail.gmail.com>
 <CAEUhbmWiyHVrHdXED1nQV4Lm3JLgwmDNAUr3HiAfOMD+hLAP6A@mail.gmail.com>
Message-ID: <CAEUhbmWR58b2Ykg0N1_7eS01wse=mimS+G-ZcDe=xAWMVFBOJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Aug 25, 2017 at 9:47 AM, Bin Meng <bmeng.cn@gmail.com> wrote:
> Hi Thomas, Matt,
>
> On Fri, Aug 25, 2017 at 5:27 AM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> Thomas,
>>
>> On Thu, Aug 24, 2017 at 4:02 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Hello,
>>>
>>> On Thu, 24 Aug 2017 12:50:20 -0500, Matthew Weber wrote:
>>>
>>>> > Unfortunately, simicsfs is no longer available at
>>>> > http://download.simics.net/pub/simicsfs-1.18.tar.gz, where Buildroot
>>>> > currently downloads it. The build only succeeds because we have a
>>>> > backup of this tarball at http://sources.buildroot.net.
>>>>
>>>> The project I originally did the 1.18 integration on completed ~2yrs
>>>> back and my access to WindRiver Simics material is now gone.  It's too
>>>> bad they didn't keep this driver public, however you may check with
>>>> your WindRiver Simics contacts to see if they just moved the site and
>>>> you could propose an update to this Buildroot package fixing support.
>>>
>>> To be honest, since the source code is no longer available online, I'm
>>> not sure it's really worth keeping this package in Buildroot. Let's see
>>> if Bin gets some feedback from Windriver about putting the tarball back
>>> online, publicly available. If there is no feedback, we'll drop the
>>> package I believe.
>>>
>>
>> Agree, that would make sense.
>>
>
> Thanks for all your clarifications and suggestions. I did not see this
> is an issue of buildroot. Actually I tried the
> http://download.simics.net/ link looking for a newer version but
> failed so I posted this question in case some others know how. I will
> contact Wind River Simics guys for some updates.
>

I've got feedback from Simics guys regarding to simicsfs. Here is the situation:

The latest simicsfs kernel module (v1.22) supports latest kernel, and
is available in the simics open source package. However they are
moving away from the simicsfs kernel module, replacing it with the
user mode Simics Agent (Matic). They've seen that the kernel module
has required too much maintenance work. For this reason they don't
want to encourage use of it.

Regards,
Bin
