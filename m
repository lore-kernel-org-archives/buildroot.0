From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 10:49:33 +0100
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <8245f0c5-94fc-a0b3-9710-8c0c779dcbdd@mind.be>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231718.090c22ef@windsurf.lan>
 <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
 <20180228073827.312a9a6f@windsurf.home>
 <3a17ac42-e24b-149d-30d3-654545e8c1eb@mind.be>
 <CANQCQpbzWdfmXe-6dJuWzNM0S_DgVYDazFC2_ZsdbVnA3WHcEQ@mail.gmail.com>
 <8245f0c5-94fc-a0b3-9710-8c0c779dcbdd@mind.be>
Message-ID: <20180302104933.39fbda31@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Mar 2018 09:19:25 +0100, Arnout Vandecappelle wrote:

>  Just to be clear about what you're saying here: in v3, you'll making it so that
> nothing has to be done explicitly in the package to get a CPE ID, but it may be
> (and probably will be) invalid? So that the initial report will contain a huge
> amount of invalid entries, and we can fix them one by one?
> 
>  I realize I'm contradicting myself, but that still leaves us with a problem (or
> rather, limitation). We have no way of keeping track of which packages have been
> checked and which haven't, so we have no way of keeping track of which ones are
> broken.
> 
>  Or perhaps the pkg-stats script could eventually check the entry in the CPE
> database, and add a column to indicate that it's valid or not?

Yes, that would be the idea.

> > The CPE list will be as accurate as people using it update the NIST
> > entries, either manually or as Buildroot nudges them to send an email.
> > The CVEs those CPEs will find is another complete story and most open
> > ways of searching for those don't concluded clean results without a
> > good amount of manual intervention.  
> 
>  Yes, I do realize that this is a kind of catch-22 situation, if nobody uses the
> database then obviously it will not be up-to-date. But to be honest, right now I
> don't even really understand what kind of information you can get from it even
> in the ideal case. That's why I asked to post an RFC script, so we can get some
> idea of what the end goal is (and ultimately, whether this is worth the effort).

Yes, I agree. The current proposal that just adds CPE_ID to packages,
and has a mechanism to generate a CSV based on that isn't very useful
per-se. I would also like to see the tooling that processes those
CPE_ID to query the NIST database, and get some useful data out of it.

Even if the data isn't great for the moment because the NIST database
is limited, it would show how the whole thing would be useful.

Right now the patch series just adds some IDs and generates a CSV with
those IDs, which isn't terribly useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
