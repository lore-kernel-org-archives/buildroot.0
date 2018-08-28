From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Aug 2018 15:17:01 +0300
Subject: [Buildroot] [PATCH] libsoup: security bump to version 2.62.3
In-Reply-To: <87va7u66d0.fsf@dell.be.48ers.dk>
References: <b3371f0ae3c4c91fc17182950ecaf97879d7da34.1535448446.git.baruch@tkos.co.il>
 <87zhx668nx.fsf@dell.be.48ers.dk> <87mut6ybj5.fsf@tkos.co.il>
 <87va7u66d0.fsf@dell.be.48ers.dk>
Message-ID: <87lg8qy9c2.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard writes:
>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>  > Peter Korsgaard writes:
>  >>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>  >>
>  >> > Fixes CVE-2018-12910: The get_cookies function in soup-cookie-jar.c in
>  >> > libsoup 2.63.2 allows attackers to have unspecified impact via an empty
>  >> > hostname.
>  >>
>  >> > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  >>
>  >> Thanks! I started looking at this myself, but got sidetracked.
>  >>
>  >> Is 2.62.x the first release containing this fix? Should we also cherry
>  >> pick this for 2018.02.x / 2018.05.x or is there a smaller patch that
>  >> could be applied instead?
>
>  > The upstream fix from the (stable) gnome-3-28 branch is:
>
>  >   https://gitlab.gnome.org/GNOME/libsoup/commit/c5c41ad1d36c1efb3226a74ac8ea591419882892
>
>  > You can cherry pick it to the gnome-3-22 branch that carries 2.56.x.
>
> Thanks. Is that the best solution or does upgrading to 2.62.x look
> "safe" for 2018.02 / 2018.05 / 2018.08?

Patch backport would probably be safer for master and stable. I'll post
a patch.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
