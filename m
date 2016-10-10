From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2016 21:28:40 +0200
Subject: [Buildroot] [PATCH 1/7] libglib2: bump to version 2.50.0
In-Reply-To: <98ef1d1c-108c-eddc-1c1f-ef54aae02eda@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
 <20160921141148.3aedf147@free-electrons.com>
 <20161009220744.3f41b8f2@free-electrons.com>
 <7dc3ea74-e874-4b9b-b6e3-2789bf126616@zacarias.com.ar>
 <20161010194900.069c347b@free-electrons.com>
 <98ef1d1c-108c-eddc-1c1f-ef54aae02eda@zacarias.com.ar>
Message-ID: <20161010212840.554288c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Oct 2016 14:57:04 -0300, Gustavo Zacarias wrote:

> First, i didn't like the hyperbole in the commit message, it's not 500+ 
> failures, it didn't even reach 200.

There are really 500+ breakage of libglib2 2.25.0, though admittedly
not all of them are necessarily related to the crc32 issue.

> Second, it's only for static builds.

Correct.

> Third, as i told you on IRC i'd look into it time allowing, this is 
> voluntary work on spare time, so this revert didn't rest in happily with me.

Sure, and I'm perfectly fine with that. But then, you should also
understand that if the problem isn't fixed in a reasonable time frame
and causes a large number of build failures, it's normal if we revert,
to take the time to do it properly.

I'm routinely doing this. A very recent example are the changes from
Thomas DS on binutils/gdb to avoid the texinfo dependency: I reverted
them half an hour after applying them, because they were breaking
stuff. There's nothing wrong with this: something was broken with the
patches, they need to be fixed, and in the mean time, reverting is the
most appropriate solution.

> Fourth, i never left any big breakage of my own making at RC/release 
> time, we are breaking eggs at this time so to speak, so a little 
> headsup/patience would have been appreciated.

Well, the issues have been occurring since September 20th, when I
applied your patches. So it's been about 20 days. As you have seen
above, I reverted much more quickly the patches from Thomas DS (though
they are admittedly introducing a much more serious breakage).

> Five, yes, i knew you'd break a ton of stuff with a revert, but again 
> "fourth" no headsup on IRC or anything - there's a reason the whole 
> gnome stuff bump was in a series.

I pinged you several times on IRC about this. I could dig the logs if
you want to, but I don't think it's the point. The failures have been
around for a while, and therefore hiding potentially lots of other
failures. After some time, if no fix comes up, it's just normal to
revert.

> As you probably know the latest uclibc bump broke powerpc entirely and i 
> didn't see any revert there, so it kind of feels personal (i know it's 
> been fixed recently).

I think you're taking things way too personally here. Yes the uclibc
bump was broken (but it was kind of expected due to the massive change
introduced in 1.0.18), and it was fixed relatively quickly. But again,
look at Thomas DS patches: I reverted them. Look at the patches from
Bernd bumping Perl: I reverted them because Fran?ois Perrad didn't like
them. Ditto for other patches from Bernd bumping some Python packages:
I reverted them because Christophe Vu-Brugier gave some negative
feedback about them.

Reverting is just a normal thing, you shouldn't take it personally.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
