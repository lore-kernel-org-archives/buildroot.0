From: Will Newton <will.newton@gmail.com>
Date: Tue, 10 Aug 2010 17:28:24 +0100
Subject: [Buildroot] Build failure with 2010.08-rc1
In-Reply-To: <20100810182338.5c2b987c@surf>
References: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
	<AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
	<20100810182338.5c2b987c@surf>
Message-ID: <AANLkTinxGwn3WaUT6r1THYUF-cmxSkYbzSsSXHYUbjf7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 10, 2010 at 5:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 10 Aug 2010 14:23:35 +0100
> Will Newton <will.newton@gmail.com> wrote:
>
>> This problem appears to only affect gcc 4.2.4.
>
> Interesting. I'm 100% sure that 2 weeks ago, gcc 4.2.2 for AVR32 was
> building correctly. And with today's Git, it doesn't build, failing
> with the exact same error message you're having.
>
> I'm currently retrying the build with the Git as it was two weeks ago
> and will start bisecting. I'm kind of suspecting the changes made to
> the gcc build procedure to support NPTL in uClibc.

Hi Thomas,

Yes, it is that patch that has caused the failure. Unfortunately there
is no simple fix I have found just yet. gcc prior to 4.3 always
attempts to build libgcc which will fail with the new build process.
