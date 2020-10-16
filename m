From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Oct 2020 12:03:05 +0200
Subject: [Buildroot] [PATCH v4] package/libtalloc: new package
In-Reply-To: <CAH3uZAwsvcv5kNFCi_fHgoszzbvKGbh52OeX1eqPbWEpfzYoVg@mail.gmail.com>
References: <20201014170254.6184-1-dgouarin@gmail.com>
 <20201015200609.20205-1-dgouarin@gmail.com>
 <20201015221657.7a224c6a@windsurf>
 <CAH3uZAwsvcv5kNFCi_fHgoszzbvKGbh52OeX1eqPbWEpfzYoVg@mail.gmail.com>
Message-ID: <20201016120305.23b2c455@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Fri, 16 Oct 2020 08:25:26 +0200
david gouarin <dgouarin@gmail.com> wrote:

> I agree, HOST_DIR is completely wrong here, I totally missed that, and I
> admit I still have difficulties formatting my patches, mainly because I
> have to work in an isolated network :)

Ah, indeed, that may be not the most efficient way of working :/

> I have however sent a new revision for both freeradius and libtalloc as a
> series using git send-email as described in the documentation,  I don't
> understand what is wrong ?

They are not numbered: you probably used "git format-patch -N", but you
shouldn't use the -N option in this case.

For patches sent to Buildroot, we want them numbered, so they clearly
appear as a series and we understand that they depend on each other.

For patches to Buildroot packages (i.e patches in package/foo/*.patch),
we want them *NOT* numbered, as otherwise the 2/3 or 5/6 numbering very
quickly gets out of date when adding/removing patches, and this
numbering is already sufficiently explicit by the name of the patches
(0001-something.patch, 0002-something-else.patch).

Perhaps this is what caused the confusion ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
