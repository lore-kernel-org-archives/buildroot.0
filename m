From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 8 Aug 2011 13:39:05 +0200
Subject: [Buildroot] [PATCH] Fix sorting-related issue when using make
	3.82
In-Reply-To: <20110805173438.4bc1285f@skate>
References: <b48283f33363fb03ff99.1312556072@localhost6.localdomain6>
 <20110805173438.4bc1285f@skate>
Message-ID: <CAAXf6LWME7oNETcrMY0wJk3y1h0nLvj0wVWzSyyEd6+DHRZnrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 5, 2011 at 5:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Thomas,
>
> The commit log should be wrapped to ~80 columns.
>
> Le Fri, 05 Aug 2011 16:54:32 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> In make 3.82, wildcards are no longer sorted. This impacts lines like:
>> ? ? ? include package/*/*.mk
>>
>> A specific scenario under which this fails: if the .mk file of an autotools-based package with FOO_AUTORECONF set to yes, happens to be included before the autoconf/autoconf.mk file, the $(AUTORECONF) variable is not yet set and autoreconfiguration fails with the following message:
>
> I don't think it is the right fix, because there shouldn't be
> things that depend on the order of inclusion of the various packages.

That makes sense...

>
>> caused by the following statement in package/Makefile.autotools.in:
>> ? ? ? $(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
>
> Can you try to use $$(AUTORECONF) instead of $(AUTORECONF) ?

What exactly is your reasoning here?

Although I am absolutely positive that the above patch fixed the issue
(albeit incorrectly) (I applied and unapplied the patch several
times), I cannot reproduce it anymore now. I must have changed
something else that has an impact.

If no-one else has problems with make-3.82, and until I stumble upon
it again, I think we better leave it.

Sorry for the confusion,

Thomas
