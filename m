From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Nov 2013 10:15:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-19
In-Reply-To: <20131120094308.3fe6ec42@skate>
References: <20131120073002.EB8E9101271@stock.ovh.net>
 <CAAXf6LUUzKXe9XiP8BdPvjBguGzAKnzkxDteggsqiFgZBvygvg@mail.gmail.com>
 <20131120094308.3fe6ec42@skate>
Message-ID: <CAAXf6LXR7nkukEfPn571ZfckPf2BsBHoKxTdZv5GpNZUWxO3Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 20, 2013 at 9:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 20 Nov 2013 09:02:56 +0100, Thomas De Schampheleire wrote:
>
>> On Wed, Nov 20, 2013 at 8:30 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> [..]
>> >      avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/584d71f91c9a9bc115e49b77be8576cab76a8210/
>>
>> Error is:
>>
>> Thread.cpp: In member function 'void scx::Thread::set_priority(int)':
>> Thread.cpp:117: error: 'pthread_setschedprio' was not declared in this scope
>> make[3]: *** [Thread.lo] Error 1
>>
>> However, sconeserver already depends on threads. It seems this
>> function pthread_setchedprio has not always been available. The man
>> page of my system says glibc >= 2.3.4. Could it be that the toolchain
>> (uclibc-based) is too 'old'? How to handle this case: depending on the
>> toolchain version the package may or may not build...
>
> It is only implemented in the NPTL thread implementation of uClibc,
> which AVR32 doesn't support. So it's another instance of
> http://patchwork.ozlabs.org/patch/258723/ being needed, I believe.

Ok, so then I propose to revive that patch early in the 2014.02 cycle...

Thanks for your feedback,
Thomas
