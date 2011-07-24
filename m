From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jul 2011 13:23:13 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <20110721075819.5a535238@skate>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate>
 <87livs1xv4.fsf@macbook.be.48ers.dk>
 <20110721075819.5a535238@skate>
Message-ID: <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 21, 2011 at 7:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 20 Jul 2011 22:49:19 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
>> Or simply drop the custom ccache location and let people set CCACHE_DIR
>> if they don't like the default (and hence expected) ~/.ccache location.
>
> That's another possibility, but I find it quite confusing to have some
> parameters set by environment variables, and some other by
> configuration options.

The disadvantage with this particular configuration variable, is that
it requires a forced recompilation of host-ccache in order for changes
to this variable to take effect.

Another solution is to remove the hardcoded cache directory, use the
CCACHE_DIR environment variable, but let buildroot set that variable
based on BR2_CCACHE_DIR (a configuration option). This addresses
Thomas' point regarding mixing environment variables and configuration
options, and my request of being able to change the cache directory
and making sure these changes are automatically in effect.

What do you think?

Thanks,
Thomas
