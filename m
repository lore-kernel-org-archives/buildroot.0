From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 17 Mar 2015 01:29:06 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-15
In-Reply-To: <20150316231703.329d6f87@free-electrons.com>
References: <20150316073020.6611C100E85@stock.ovh.net>
 <CAMo8BfKuPTASXR9JEx=aGctfNxNcr2PDewyS+GGt6jcbeY8dbw@mail.gmail.com>
 <20150316231703.329d6f87@free-electrons.com>
Message-ID: <CAMo8BfKdwq_AA4neTCJyuHMuA7ZES3L+wJJa2at-MHUCPwTfxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 17, 2015 at 1:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Max Filippov,
>
> On Tue, 17 Mar 2015 01:02:28 +0300, Max Filippov wrote:
>> On Mon, Mar 16, 2015 at 10:30 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> >       xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/90c318e3a9ef5e626d0a80e36695d34eda21f97e/
>> >       xtensa |               memcached-1.4.22 | NOK | http://autobuild.buildroot.net/results/cd8e9d9a5f454c321071c21192958aeee9c39e73/
>>
>> Caused by disabled UCLIBC_HAS_GNU_GETSUBOPT option in the uclibc config.
>> Also reproducible with other architectures that use uclibc.
>> I guess we can just enable it in the config, additional code is really small.
>
> On libnl, the error only happened twice, and only on xtensa:
> http://autobuild.buildroot.org/?reason=libnl-3.2.25. What's weird is
> that in uClibc-0.9.33.config, which we use on other architectures, we
> also have UCLIBC_HAS_GNU_GETSUBOPT disabled. But still there is a
> getsubopt symbol in the generated uClibc .so file.
>
> Needs more investigation, it seems.

Ok, will look at it some more...

-- 
Thanks.
-- Max
