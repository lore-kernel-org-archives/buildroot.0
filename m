From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 29 Sep 2010 11:32:29 +0300
Subject: [Buildroot] Libtool work: a tentative summary
In-Reply-To: <20100928223652.6dc72083@surf>
References: <20100928223652.6dc72083@surf>
Message-ID: <AANLkTi=Sf1+acAXfCgJcTv+4Yrtw0nEH+_Ugv3+0dVk0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 28, 2010 at 11:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
> Conclusion
> ==========
>
> Therefore, the choice seems to be between :
>
> ?* A conservative solution, only extending what we have today, with
> ? limited changes and impact, but keeping the existing hacks in place.
>
> ?* A radically different solution, with wider changes, more in line
> ? with libtool future, but requiring an autoreconfiguration of all
> ? packages that will not have libtool 2.4 by default.
>
> In my opinion, we should settle on a solution before mid-october, in
> order to merge it before the end of october and give us enough time for
> testing before the release at the end of november. Considering how much
> time Martin and Lionel have dedicated to this issue, I think that their
> respective work deserve some attention.
>
> Thoughts ? Comments ?

I would go for a conservative solution.
The main reason here is compile speed.
Currently my configuration takes ~1 hour to compile on my 4x3.4GHz
machine with DDR3 RAM...
The worst part here is that autoreconfigure and ./configure scripts doesn't
scale on multicore CPU :(
So adding a lot more autoreconfigure usage would drastically reduce
build time.
