From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 23:41:43 +0100
Subject: [Buildroot] [PATCH 1/1] kmod: fix build with pkgconf 1.5.3
In-Reply-To: <CAPi7W82C5KNdz6PONUfeAdn1R-H_TqcR29vz3FEsnjgOpe_pzQ@mail.gmail.com>
 (Fabrice Fontaine's message of "Fri, 14 Dec 2018 22:08:49 +0100")
References: <20181214154728.30189-1-fontaine.fabrice@gmail.com>
 <87bm5nettd.fsf@dell.be.48ers.dk>
 <CAPi7W82C5KNdz6PONUfeAdn1R-H_TqcR29vz3FEsnjgOpe_pzQ@mail.gmail.com>
Message-ID: <87lg4rd93s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> Hmm, how did this work before if there wasn't anything to ensure
 >> bash-completion was built before kmod? Just the alphabetical order?

 > You're right, personally, I think that we should add a bash-completion
 > dependency but bash-completion is not a "real" build time dependency,
 > it's only needed to retrieve completionsdir.
 > Because I was told to remove udev dependency from alsa-utils during
 > review of https://patchwork.ozlabs.org/patch/1013180, I applied the
 > same logic for kmod.
 > Howerver if you want, I can send a new patch to add bash-completion dependency.

OK. As we now explicitly pass --with-completiondir (and hence not rely
on bash-completion.pc) and the install logic creates the destination
directory if needed, I don't think we really _NEED_ it.

-- 
Bye, Peter Korsgaard
