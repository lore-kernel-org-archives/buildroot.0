From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 1 Mar 2015 21:02:55 +0100
Subject: [Buildroot] [PATCH v5 10/11] autobuild-run: kill all children
	on SIGTERM
In-Reply-To: <20150228202805.50d377d3@free-electrons.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-11-git-send-email-patrickdepinguin@gmail.com>
 <20150228202805.50d377d3@free-electrons.com>
Message-ID: <CAAXf6LUhzNcJ=W-uFqx0dSTqguNbr+Urxrw-93tWMCbaUSOy-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Feb 28, 2015 at 8:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 12 Dec 2014 21:04:55 +0100, Thomas De Schampheleire wrote:
>
>> -from multiprocessing import Process
>> +import multiprocessing
>
> This change...
>
>>      for i in range(0, int(args['--ninstances'])):
>>          p = Process(target=run_instance, kwargs=dict(
>
> Breaks this, it should be changed to multiprocessing.Process.
>
> I've fixed that up locally for now, but it essentially means that your
> patch series was never executed, as it basically cannot work at all :-/

Naturally I did test this series, and this patch, but I must have made
a final 'fixup' before submitting without retesting. Shame on me,
sorry :-s
