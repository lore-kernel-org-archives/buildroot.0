From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 14:41:40 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
In-Reply-To: <56714A65.80301@imgtec.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
 <20151214210913.227563c9@free-electrons.com>
 <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
 <20151214214337.2933ea41@free-electrons.com>
 <20151214211045.GA4152@free.fr>
 <1450132540.4928.24.camel@embedded.rocks>
 <56714A65.80301@imgtec.com>
Message-ID: <20151216144140.3b3224c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Dec 2015 11:26:29 +0000, Vicente Olivert Riera wrote:

> >> So, I think we have a few options here:
> >>
> >>  1) keep all the three existing versions, add 5.2
> >>  2) keep 0.10 and 0.12, replace 4.2 with 5.2
> >>  3) keep 0.10, ditch 0.12, replace 4.2 with 5.2
> >>  4) dith 0.10 and 0.12, replace 4.2 with 5.2
> >>
> >> I would lean toward either 2 or 3.
> >>
> >> 3 is IMHO the best solution: 5.2 is the best choice when all the
> >> conditions are met; 0.10 is the fallback, maybe not the optimum in
> >> case 0.12 would have fit, but since that's a fallback I don't think
> >> it matters much...
> >>
> > 
> > As 4.x is a LTS release I would not drop it for the 5.x release.
> > 
> > I would keep all the three version we have - they are all still
> > maintained and v0.12 and v4 are both even LTS releases.
> > 
> > New versions are often not compatible with older versions of Node.js -
> > it's similiar to Lua.
> > 
> > So I would lean toward 1.
> 
> I agree with you. Dropping a LTS version doesn't look good to me. We
> could do it when it's not maintained anymore. Right now I vote for
> keeping the three versions we already have plus adding the 5.2.0 because
> is the new stable: option 1.

I am personally not very happy with option (1). Keeping gazillions of
versions means that we have potentially to test all those options. And
the random testing done by the autobuilders does not work to randomize
"choice" options, i.e we will never test the non-default versions.

What is the motivation for keeping all those versions around? While I
can understand that keeping 0.10.x around to have a fallback solution
for ARMv5 platform is desired, I don't understand why we would keep
0.12.x and 4.2.x.

The fact that 0.12.x and 4.2.x are still maintained upstream as LTS
versions is completely irrelevant. There are other projects that may
maintain older branches as LTS, and still we don't support all the
possible maintained versions.

Are there incompatibilities between 0.12.x, 4.2.x and 5.2.x that
prevent a user from easily upgrading?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
