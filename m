From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 3 Mar 2014 11:19:12 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303110555.1166a171@skate>
References: <20140303073010.B46B51015B7@stock.ovh.net>
 <20140303090219.65a08cc7@skate>
 <CAHXCMMLUY6+eN6EzqVBk-=o0MO4QZktyRsmTHSFcRhX7B4Jk2Q@mail.gmail.com>
 <20140303110555.1166a171@skate>
Message-ID: <CAHXCMMJW3xN7cAOoMLXX6ZGxNNSEga3_osB1g-oE7eKJGb9JqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 3, 2014 at 11:05 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Mon, 3 Mar 2014 10:38:19 +0100, Samuel Martin wrote:
>
>> > Problem of host python being Python 3 and not Python 2.
>> [...]
>>
>> I've started looking at this host-python2 thing.
>>
>> So far, I have something working for host-scons, host-python-m2crypto and crda.
>> I still have to look at samba4, and cleanup the patches before
>> submitting them ;)
>
> Ok, cool. What approach have you chosen?

I added a variable-knob to the pkg-python infra named
$(2)_FORCE_HOST_PYTHON (name can be debated later :P) which set the
proper host python dependency, and call the proper python interpreter
during build and install steps.

This variable only affects host packages.

If the some configure/build/install commands are overloaded in th *.mk
file, the right python interpreter should be explicitly called.
If the package define some tool variable (eg.: SCONS), the variable
should explicitly called the right python interpreter.

That's roughly the headlines.
Regards,

-- 
Samuel
