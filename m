From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jul 2016 08:08:59 -0700
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160729112327.5af5618a@free-electrons.com>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
 <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
 <20160729093218.36d66c86@free-electrons.com>
 <CAMKF1sp5YvKanMM_AjPsZqmNOXrJAWsELpEcch+7Wec3MfhVzA@mail.gmail.com>
 <20160729112327.5af5618a@free-electrons.com>
Message-ID: <CAMKF1spxedbMXzPnDU41nEFZdJ1qfc4Y0UqeQwxDaNmR4cmZHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 29, 2016 at 2:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 29 Jul 2016 01:16:24 -0700, Khem Raj wrote:
>
>> > Can you give some more details? Did you look at the original commit log
>> > for this change? It pointed out some real problems when using -I, which
>> > in theory should be resolved by using -isystem.
>>
>> see
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=0a6e162c47017ecf51b466218fb549e0e199f4c4
>>
>> If packages use include_next they will have problems.
>
> Right, but like your patch shows, problems occur when packages are
> broken, so they should "simply" be fixed.

yes

>
> I don't really see another option than using -isystem in fact. What do
> you suggest?


with specifying your own -isystem you will be introducing the issue too see
this thread for more
https://lists.fedoraproject.org/archives/list/devel at lists.fedoraproject.org/thread/Q5SWCUUMWQ4EMS7CU2CBOZHV3WZYOOTT/

I had to remove it from OE all around


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
